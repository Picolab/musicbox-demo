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

    directory = "/musicbox-notes/notes/"
    
    paths = {
                "R": directory+"silence.wav",
                "C3": directory+"C3.wav",
                "C#3": directory+"C#3.wav",
                "D3": directory+"D3.wav", 
                "D#3": directory+"D#3.wav", 
                "E3": directory+"E3.wav", 
                "F3": directory+"F3.wav", 
                "F#3": directory+"F#3.wav", 
                "G3": directory+"G3.wav", 
                "G#3": directory+"G#3.wav", 
                "A3": directory+"A3.wav", 
                "A#3": directory+"A#3.wav",
                "B3": directory+"B3.wav", 
                "C4": directory+"C4.wav",
                "C#4": directory+"C#4.wav",
                "D4": directory+"D4.wav", 
                "D#4": directory+"D#4.wav", 
                "E4": directory+"E4.wav", 
                "F4": directory+"F4.wav", 
                "F#4": directory+"F#4.wav", 
                "G4": directory+"G4.wav", 
                "G#4": directory+"G#4.wav", 
                "A4": directory+"A4.wav", 
                "A#4": directory+"A#4.wav",
                "B4": directory+"B4.wav", 
                "C5": directory+"C5.wav",
                "C#5": directory+"C#5.wav",
                "D5": directory+"D5.wav", 
                "D#5": directory+"D#5.wav", 
                "E5": directory+"E5.wav", 
                "F5": directory+"F5.wav",
                "F#5": directory+"F#5.wav", 
                "G5": directory+"G5.wav", 
                "G#5": directory+"G#5.wav", 
                "A5": directory+"A5.wav", 
                "A#5": directory+"A#5.wav",  
                "B5": directory+"B5.wav", 
                "C6": directory+"C6.wav",
                "C#6": directory+"C#6.wav",
                "D6": directory+"D6.wav", 
                "D#6": directory+"D#6.wav", 
                "E6": directory+"E6.wav", 
                "F6": directory+"F6.wav", 
                "F#6": directory+"F#6.wav", 
                "G6": directory+"G6.wav",
                "G#6": directory+"G#6.wav",
                "A6": directory+"A6.wav", 
                "A#6": directory+"A#6.wav", 
                "B6": directory+"B6.wav", 
                "C7": directory+"C7.wav",
                "C#7": directory+"C#7.wav",
                "D7": directory+"D7.wav", 
                "D#7": directory+"D#7.wav", 
                "E7": directory+"E7.wav", 
                "F7": directory+"F7.wav", 
                "F#7": directory+"F#7.wav", 
                "G7": directory+"G7.wav",
                "G#7": directory+"G#7.wav",
                "A7": directory+"A7.wav", 
                "A#7": directory+"A#7.wav", 
                "B7": directory+"B7.wav", 
                "C8": directory+"C8.wav"
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
                if (ent:playlist.index(s.keys()[0]) < 0 && s.values()[0].length() > 0);
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