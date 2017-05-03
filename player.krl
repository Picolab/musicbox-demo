ruleset player {
  meta {
    shares __testing
  }

  global {
    __testing = { "queries": [ { "name": "__testing" } ],
                  "events": [{ "domain": "testing", "type": "importURL", "attrs": ["url"] },
                             { "domain": "testing", "type": "setEventsPerBeat", "attrs": ["events_per_beat"] },
                             { "domain": "testing", "type": "setBeatSkip", "attrs": ["beat_skip"] },
                             { "domain": "testing", "type": "playSong" },
                             { "domain": "testing", "type": "playBackward" },
                             { "domain": "testing", "type": "nextSong" },
                             { "domain": "testing", "type": "songStart" },
                             { "domain": "testing", "type": "playlistStart" },
                             { "domain": "testing", "type": "clearPlaylist" } ] }

    type = "wav"

    directory = "/musicbox-notes/notes/" + type + "/"
    
    paths = {
                "R": null,
                "C3": directory+"C3." + type,
                "C#3": directory+"C#3." + type,
                "D3": directory+"D3." + type, 
                "D#3": directory+"D#3." + type, 
                "E3": directory+"E3." + type, 
                "F3": directory+"F3." + type, 
                "F#3": directory+"F#3." + type, 
                "G3": directory+"G3." + type, 
                "G#3": directory+"G#3." + type, 
                "A3": directory+"A3." + type, 
                "A#3": directory+"A#3." + type,
                "B3": directory+"B3." + type, 
                "C4": directory+"C4." + type,
                "C#4": directory+"C#4." + type,
                "D4": directory+"D4." + type, 
                "D#4": directory+"D#4." + type, 
                "E4": directory+"E4." + type, 
                "F4": directory+"F4." + type, 
                "F#4": directory+"F#4." + type, 
                "G4": directory+"G4." + type, 
                "G#4": directory+"G#4." + type, 
                "A4": directory+"A4." + type, 
                "A#4": directory+"A#4." + type,
                "B4": directory+"B4." + type, 
                "C5": directory+"C5." + type,
                "C#5": directory+"C#5." + type,
                "D5": directory+"D5." + type, 
                "D#5": directory+"D#5." + type, 
                "E5": directory+"E5." + type, 
                "F5": directory+"F5." + type,
                "F#5": directory+"F#5." + type, 
                "G5": directory+"G5." + type, 
                "G#5": directory+"G#5." + type, 
                "A5": directory+"A5." + type, 
                "A#5": directory+"A#5." + type,  
                "B5": directory+"B5." + type, 
                "C6": directory+"C6." + type,
                "C#6": directory+"C#6." + type,
                "D6": directory+"D6." + type, 
                "D#6": directory+"D#6." + type, 
                "E6": directory+"E6." + type, 
                "F6": directory+"F6." + type, 
                "F#6": directory+"F#6." + type, 
                "G6": directory+"G6." + type,
                "G#6": directory+"G#6." + type,
                "A6": directory+"A6." + type, 
                "A#6": directory+"A#6." + type, 
                "B6": directory+"B6." + type, 
                "C7": directory+"C7." + type,
                "C#7": directory+"C#7." + type,
                "D7": directory+"D7." + type, 
                "D#7": directory+"D#7." + type, 
                "E7": directory+"E7." + type, 
                "F7": directory+"F7." + type, 
                "F#7": directory+"F#7." + type, 
                "G7": directory+"G7." + type,
                "G#7": directory+"G#7." + type,
                "A7": directory+"A7." + type, 
                "A#7": directory+"A#7." + type, 
                "B7": directory+"B7." + type, 
                "C8": directory+"C8." + type
                }

    getNotes = function() {
       ent:current_beat < ent:songs[ent:playlist[ent:current_song]].length() => 
           ent:songs[ent:playlist[ent:current_song]][ent:current_beat.klog("index") ] | null
    }

  }

          rule importURL {
            select when testing importURL
            pre {
              s = http:get(event:attr("url"))["content"].decode()
            }
              send_directive("song")
                with body = s
            always {
              raise explicit event "loadSong"
                with song = s
                if (ent:playlist.index(s.keys()[0]) < 0 && s.values()[0].length() > 0)
            }
          }

          rule loadSong {
            select when explicit loadSong
            pre {
              song = event:attr("song")
            }
              noop()
            always{
              ent:songs := ent:songs.put(song);
              ent:playlist := ent:playlist.append(song.keys()[0]);
              ent:current_beat := 0;
              ent:current_song := ent:playlist.length() - 1
            }
          }

          rule setEventsPerBeat {
              select when testing setEventsPerBeat
              pre {
                epb = event:attr("events_per_beat")
              }
                noop()
              always {
                ent:event_count := 0;
                ent:events_per_beat := epb
              }
          }

          rule setBeatSkip {
              select when testing setBeatSkip
              pre {
                skip = event:attr("beat_skip")
              }
                noop()
              always {
                ent:beat_skip := skip
              }
          }
          
          rule playSong {
              select when testing playSong
                foreach getNotes().klog("notes") setting (note)
              pre {}
              if (not note.isnull() && not paths[note].isnull() && ent:event_count == 0) then
                playSound:play(paths[note])
              always {
                ent:current_beat := (ent:event_count != 0) => ent:current_beat | 
                    ((ent:current_beat < ent:songs[ent:playlist[ent:current_song]].length() - 1) => ent:current_beat + ent:beat_skip | 0) on final;
                ent:event_count := (ent:event_count < ent:events_per_beat - 1) => ent:event_count + 1 | 0 on final
              } 
          }

          rule playBackward {
              select when testing playBackward
                foreach getNotes().klog("notes") setting (note)
              pre {}
              if (not note.isnull() && not paths[note].isnull() && ent:event_count == 0) then
                playSound:play(paths[note])
              always {
                ent:current_beat := (ent:event_count != 0) => ent:current_beat | 
                    ((ent:current_beat > 0) => ent:current_beat - 1 | ent:songs[ent:playlist[ent:current_song]].length() - ent:beat_skip) on final;
                ent:event_count := (ent:event_count < ent:events_per_beat - 1) => ent:event_count + 1 | 0 on final
              } 
          }

          rule nextSong {
            select when testing nextSong 
              noop()
            always{
              ent:current_beat := 0;
              ent:current_song := (ent:current_song < ent:playlist.length() - 1) => ent:current_song + 1 | 0
            }
          }

          rule songStart {
            select when testing songStart
              noop()
            always{
              ent:current_beat := 0
            }
          }

          rule playlistStart {
            select when testing playlistStart
              noop()
            always{
              ent:current_beat := 0;
              ent:current_song := 0
            }
          }

          rule clearPlaylist {
            select when testing clearPlaylist
              noop()
            always{
              ent:songs := {};
              ent:playlist := [];
              ent:current_beat := 0;
              ent:current_song := 0;
              ent:event_count := 0;
              ent:events_per_beat := 1;
              ent:beat_skip := 1
            }
          }
              
}