ruleset player {
  meta {
    shares __testing
  }

  global {
    __testing = { "queries": [ { "name": "__testing" } ],
                  "events": [{ "domain": "testing", "type": "importSong", "attrs": ["name","track"] },
                             { "domain": "testing", "type": "importURL", "attrs": ["url"] },
                             { "domain": "testing", "type": "setEventsPerBeat", "attrs": ["events_per_beat"] },
                             { "domain": "testing", "type": "playSong" },
                             { "domain": "testing", "type": "playBackward" },
                             { "domain": "testing", "type": "nextSong" },
                             { "domain": "testing", "type": "songStart" },
                             { "domain": "testing", "type": "playlistStart" },
                             { "domain": "testing", "type": "resetPlaylist" },
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

   default_songs = {
        "JACK" : [
["G#4","G#5"],["C5"],["D#5","G#5"],["A#4","A#5"],["C#5"],["F5","A#5"],["C5","C6"],["D#6"]
,["C5","C6"],["G#5"],["D#5"],["D#5","C5"],["G#4","G#5"],["C5"],["D#5","G#5"],["A#4","A#5"],["F5"],["A#4","A#5"]
,["C5","C6"],["D#5"],["G5"],["G#5"],["D#5"],["D#5","C5"],["G#4","G#5"],["C5"],["D#5","G#5"],["A#4","A#5"]
,["C#5"],["F5","A#5"],["C5","C6"],["D#6"],["C5","C6"],["G#5"],["D#5"],["C5"],["A#4","C#5","F5","A#5","C#6","F6"]
,["R"],["R"],["A#5"],["F5"],["C#5","C#6"],["D#5","C6"],["G5"],["D#5"],["G#4","G#5"],["R"],["R"]
        ],

        "WHAT_IS_LOVE" : [
["C6"],["R"],["B5"],["R"],["C6"],["R"],["A5"],["R"],["C6"],["R"],["B5"],
["R"],["C6"],["R"],["A5"],["R"],["C6"],["R"],["B5"],["R"],["C6"],["R"],["G5"],["R"],["C6"],["R"],
["B5"],["R"],["C6"],["R"],["G5"],["R"],["B5"],["R"],["A5"],["R"],["B5"],["R"],["G5"],["R"],["B5"],
["R"],["A5"],["R"],["B5"],["R"],["G5"],["R"],["B5"],["R"],["A5"],["R"],["B5"],["R"],["G5"],["R"],
["B5"],["R"],["A5"],["R"],["B5"],["R"],["G5"],["R"],["A4","C6"],["R"],["B5"],["R"],["C6","A4"],["R"],
["A5"],["R"],["C6","A4"],["R"],["B5"],["A4"],["C6"],["R"],["A5","G4"],["R"],["C4","C6"],["R"],["B5"],
["R"],["C6","C4"],["R"],["G5"],["R"],["C4","C6"],["R"],["B5"],["C4"],["C6"],["R"],["G5","D4"],["R"],
["B5","E4"],["R"],["A5"],["R"],["E4","B5"],["R"],["G5"],["R"],["B5","E4"],["R"],["A5"],["E4"],["B5"],
["R"],["G5","F4"],["R"],["B5","G4"],["R"],["A5"],["R"],["B5","G4"],["R"],["G5"],["R"],["B5","G4"],
["R"],["A5"],["G4"],["B5"],["R"],["G4","G5"],["R"],["A4","E5","C5"],["R"],["R"],["R"],["A4","C5","E5"],
["R"],["R"],["R"],["A4","C5","E5"],["R"],["R"],["A4","C5","E5"],["R"],["R"],["A4","F5","C5"],["R"],
["G4","C5","E5"],["R"],["R"],["R"],["G4","E5","C5"],["R"],["R"],["R"],["C5","G4","E5"],["R"],["R"],
["E5","G4","C5"],["R"],["R"],["F5","C5","G4"],["R"],["G4","B4","E5"],["R"],["R"],["R"],["G4","B4","E5"],
["R"],["R"],["R"],["B4","G4","E5"],["R"],["R"],["E5","G4","B4"],["R"],["R"],["B4","G4","F5"],["R"],
["D5","B4","G5"],["R"],["R"],["R"],["D5","B4","G5"],["R"],["R"],["R"],["G5","D5","B4"],["R"],["E5"],
["D5","B4"],["G5"],["R"],["D5","B4","A5"],["R"],["A4","E5","C5"],["R"],["R"],["R"],["E5","A4","C5"],
["R"],["R"],["R"],["A4","C5","E5"],["R"],["F5"],["C5","A4"],["E5"],["R"],["C5","G5","A4"],["R"],
["E5","C5","G4"],["R"],["E5"],["R"],["E5","C5","G4"],["R"],["R"],["R"],["G4","E5","C5"],["R"],["R"],
["G4","C5"],["E5"],["R"],["C5","G5","G4"],["R"],["G4","B4","E5"],["R"],["E5"],["R"],["B4","E5","G4"],
["R"],["R"],["R"],["B4","G4","E5"],["R"],["R"],["G4","B4"],["E5"],["R"],["D5","G4","B4"],["R"],
["G5","D5","B4"],["R"],["R"],["R"],["D5","G5","B4"],["R"],["R"],["R"],["B4","D5","G5"],["R"],["E5"],
["D5","B4"],["G5"],["R"],["D5","A5","B4"],["R"]
        ], 

        "LOSTWOODS": [
["F4","F5"],["R"],["C5","A4","A5"],["R"],["C5","B5","A4"],["R"],["A4","C5"],["R"]
,["F4","F5"],["R"],["C5","A5","A4"],["R"],["B5","A4","C5"],["R"],["C5","A4"],["R"],
["F4","F5"],["R"],["A5","A4","C5"],["R"],["A4","C5","B5"],["R"],["C5","A4","E6"],["R"],
["F4","D6"],["R"],["C5","A4"],["R"],["A4","B5","C5"],["R"],["C5","A4","C6"],["R"],
["B5","E4"],["R"],["G5","G4","C5"],["R"],["C5","G4","E5"],["R"],["C5","G4"],["R"],
["E4"],["R"],["C5","G4"],["R"],["C5","G4"],["R"],["D4","D5"],["R"],
["E5","E4"],["R"],["G4","C5","G5"],["R"],["C5","E5","G4"],["R"],["C5","G4"],["R"],
["E4"],["R"],["G4","C5"],["R"],["C5","G4"],["R"],["C5","G4"],["R"],
["F5","F4"],["R"],["A5","A4","C5"],["R"],["B5","C5","A4"],["R"],["C5","A4"],["R"],
["F5","F4"],["R"],["A5","A4","C5"],["R"],["A4","B5","C5"],["R"],["C5","A4"],["R"],
["F4","F5"],["R"],["A4","C5","A5"],["R"],["C5","A4","B5"],["R"],["E6","A4","C5"],["R"],
["D6","F4"],["R"],["A4","C5"],["R"],["A4","C5","B5"],["R"],["C6","C5","A4"],["R"],
["E6","E4"],["R"],["B5","C5","G4"],["R"],["C5","G5","G4"],["R"],["G4","C5"],["R"],
["E4"],["R"],["G4","C5"],["R"],["C5","G4"],["R"],["D4","B5"],["R"],
["E4","G5"],["R"],["D5","C5","G4"],["R"],["G4","E5","C5"],["R"],["G4","C5"],["R"],
["E4"],["R"],["C5","G4"],["R"],["C5","G4"],["R"],["G4","C5"],["R"],
["D4","D5"],["R"],["F4","A4","E5"],["R"],["D4","F5"],["R"],["A4","F4"],["R"],
["G5","G4"],["R"],["A5","G4","D4"],["R"],["B5","G4"],["R"],["G4","D4"],["R"],
["C6","C4"],["R"],["B5","G4","C5"],["R"],["C4","E5"],["R"],["C5","G4"],["R"],
["C4"],["R"],["E4","A4"],["R"],["C4"],["R"],["A4","E4"],["R"],
["F5","D4","D5"],["R"],["A4","G5","E5","F4"],["R"],["F5","A5","D4"],["R"],["A4","F4"],["R"],
["B5","G5","G4"],["R"],["A5","D4","G4","C6"],["R"],["B5","D6","G4"],["R"],["G4","D4"],["R"],
["C6","C4","E6"],["R"],["D6","G4","C5","F6"],["R"],["G6","E6","C4"],["R"],["C5","G4"],["R"],
["C4"],["R"],["E4","A4"],["R"],["C4"],["R"],["A4","E4"],["R"],
["D5","D4"],["R"],["F4","E5","A4"],["R"],["D4","F5"],["R"],["F4","A4"],["R"],
["G5","G4"],["R"],["G4","D4","A5"],["R"],["B5","G4"],["R"],["D4","G4"],["R"],
["C6","C4"],["R"],["G4","B5","C5"],["R"],["C4","E5"],["R"],["C5","G4"],["R"],
["C4"],["R"],["A4","E4"],["R"],["C4"],["R"],["E4","A4"],["R"],
["F4","D4"],["R"],["E4","C4"],["R"],["A4","F4"],["R"],["G4","E4"],["R"],
["B4","G4"],["R"],["A4","F4"],["R"],["A4","C5"],["R"],["B4","G4"],["R"],
["B4","D5"],["R"],["C5","A4"],["R"],["E5","C5"],["R"],["D5","B4"],["R"],
["F5","D5"],["R"],["C5","E5"],["R"],["B5","E5"],["C6","F5"],["R"],["D5","A5"],
["E5","B5","E4"],["R"],["A4","B4"],["R"],["R"],["R"],["A4","B4"],["R"],
["E4"],["R"],["A4","B4"],["R"],["R"],["R"],["B4","A4"],["R"],
["E4"],["R"],["G#4","B4"],["R"],["G#4","B4"],["R"],["G#4","B4"],["R"],
["G#4","B4"],["R"],["R"],["R"],["E4","E5","B4","E6"],["R"],["R"],["R"]
        ],

        "PIRATES": [
["E4"],["G4"],["A4","C4","E4"],["R"],["C4","E4","A4"],["R"],["A4"],["B4"],["F4","C5","A4"],
["R"],["A4","F4","C5"],["R"],["C5"],["D5"],["D4","B4","G4"],["R"],["G4","B4","D4"],["R"],["A4"],["G4"],
["G4"],["E4","C4","A4"],["R"],["R"],["E4"],["G4"],["A4","F4","C4"],["R"],["F4","A4","C4"],["R"],["A4"],
["B4"],["E4","G4","C5"],["R"],["C5","E4","G4"],["R"],["C5"],["D5"],["B4","D4","G4"],["R"],["D4","B4","G4"],
["R"],["A4"],["G4"],["A4","C4","E4"],["R"],["R"],["R"],["E4"],["G4"],["C4","E4","A4"],["R"],["E4","C4","A4"],
["R"],["A4"],["C5"],["D5","F4","A4"],["R"],["D5","A4","F4"],["R"],["D5"],["E5"],["D5","F5","A4"],["R"],
["F5","A4","D5"],["R"],["E5"],["D5"],["C5","A4","E5"],["A4"],["R"],["R"],["A4"],["B4"],["F4","C5","A4"],["R"],
["A4","F4","C5"],["R"],["D5"],["R"],["E5","A4","C5"],["A4"],["R"],["R"],["A4"],["C5"],["E4","A4","B4"],["R"],
["B4","A4","E4"],["R"],["C5"],["A4"],["B4","E4","A4"],["R"],["R"],["R"],
["E4","E5"],["G4","G5"],["C4","E4","A4","A5"],["R"],["C4","A4","E4","A5"],["R"],["E4","C4","A4","A5"],
["B5","B4"],["F4","C5","C6","A4"],["R"],["C5","A4","F4","C6"],["R"],["C6","A4","F4","C5"],["D5","D6"],
["D4","B4","B5","G4"],["R"],["G4","D4","B5","B4"],["R"],["A5","A4"],["G5","G4"],["G5","G4"],["A4","C4","A5","E4"],
["R"],["R"],["E4","E5"],["G4","G5"],["C4","F4","A4","A5"],["R"],["C4","A4","A5","F4"],["R"],["F4","C4","A5","A4"],
["B5","B4"],["G4","C6","E4","C5"],["R"],["C5","E4","G4","C6"],["R"],["C6","C5"],["D5","D6"],["B4","B5","G4","D4"],["R"],
["D4","B4","B5","G4"],["R"],["A5","A4"],["G5","G4"],["A4","C4","A5","E4"],["R"],["R"],["R"],["E4","E5"],["G5","G4"],
["C4","E4","A4","A5"],["R"],["E4","C4","A4","A5"],["R"],["A5","A4"],["C6","C5"],["A4","F4","D5","D6"],["R"],
["D5","D6","F4","A4"],["R"],["D5","D6"],["E6","E5"],["F5","F6","A4","D5"],["R"],["F5","D5","F6","A4"],["R"],["E5","E6"],
["D6","D5"],["E5","C5","A4","E6"],["A4","A5","E4"],["R"],["R"],["E4","A5","A4"],["B5","F4","B4"],
["F4","A4","C6","C5"],["R"],["F4","C5","C6","A4"],["R"],["C6","C5"],["D6","D5"],
["C5","A4","E5","E6"],["A4","A5"],["R"],["R"],["A4","A5"],["C5","C6"],
["B4","B5","A4","E4"],["R"],["E4","A4","B4","B5"],["R"],["A6","A5"],["G#4","G#5"],
["A4","C4","E4","A5"],["R"],["A4","C4","E4","A5"],["R"],["B4","B5","E4","A4"],["R"],
["C5","C6","A4","E4"],["R"],["E4","A4","C5","C6"],["R"],["D5","F4","D6","A4"],["R"],
["E6","C5","A4","E5"],["R"],["R"],["R"],["E4","C5","C6"],["E4","A4","A5"],["E4","E5"],["R"],["R"],["R"],["R"],["R"],
["C5","F5","A4","F6"],["R"],["R"],["R"],["F4","C5","C6"],["A4","A5","F4"],["F4","F5"],["R"],["R"],["R"],["F4"],["R"],
["E4","A4"],["E4"],["C5","E4","A4"],["R"],["D4","G4","D5"],["R"],
["E4","C5","A4","E5","E6"],["R"],["A4","E5","C5","E4","E6"],["R"],["C5","E5","E4","A4","E6"],["R"],
["F4","A4","C5","F5","F6"],["A4","E5","C5","E4","E6"],["R"],["R"],["R"],["R"],
["B4","G4","D5","D4","D6"],["R"],["D4","B4","D5","G4","D6"],["R"],["D4","G4","B4","D5","D6"],["R"],
["B4","G4","D4","D5","D6"],["E4","A4","C5","E5","E6"],["R"],["R"],["R"],["E4"],
["C5","E4","E5","A4","E6"],["R"],["A4","E5","C5","E4","E6"],["R"],["A4","E5","E4","C5","E6"],["R"],
["F5","A4","F4","C5","F6"],["C5","A4","E5","E4","E6"],["R"],["R"],["A4"],["C5"],
["A4","F4","D6","D5"],["R"],["C5","A4","F4","C6"],["R"],["B4","B5","E4"],["R"],
["A4","A5","E4","C4"],["R"],["R"],["R"]
        ],

        "TETRIS": [
["E3","E6"],["R"],["E4"],["R"],["E3","G#5","B5"],["R"],["E4","C6","A5"],["R"],
["E3","D6","B5"],["R"],["E4","E6"],["D6"],["E3","C6","A5"],["R"],["E4","G#5","B5"],["R"],
["E5","A5","A3"],["R"],["A4"],["R"],["A5","A3"],["R"],["A4","C6"],["R"],
["C5","E6","A3"],["R"],["A4"],["R"],["D6","A3","B5"],["R"],["C6","A5","A4"],["R"],
["G#3","G#5","B5"],["R"],["G#4","E5"],["R"],["G#3","G#5"],["R"],["G#4","C6","A5"],["R"],
["E3","B5","D6"],["R"],["E4"],["E4"],["E3","E6","C6"],["R"],["E4"],["R"],
["A3","A5","C6"],["R"],["A4"],["R"],["A3","A5","E5"],["R"],["A4"],["R"],
["A3","A5","E5"],["R"],["A4"],["R"],["B3"],["R"],["C4"],["R"],
["D4"],["R"],["D3","D6","F5"],["R"],["R"],["R"],["D3","A5","F6"],["R"],
["C6","A6"],["R"],["C6","D3"],["C6"],["A3","B5","G6"],["R"],["F3","A5","F6"],["R"],
["C3","G5","E6"],["R"],["C4"],["R"],["R"],["R"],["C4","E5","C6"],["R"],
["C3","G5","E6"],["R"],["G3","A5"],["G5"],["D6","F5"],["R"],["G3","E5","C6"],["R"],
["E3","G#5","B5"],["R"],["B3","E5"],["R"],["G#5","B5"],["R"],["B3","A5","C6"],["R"],
["B5","D6"],["R"],["E3","G#5"],["G#4"],["C6","E6"],["R"],["G#3","G#5"],["R"],
["A3","C6","A5"],["R"],["E4"],["R"],["A3","A5","E5"],["R"],["E4"],["R"],
["A3","A5","E5"],["R"],["R"],["R"],["R"],["R"],["R"],["R"]
        ]    
    
    }

    default_playlist = ["JACK", "WHAT_IS_LOVE", "LOSTWOODS", "PIRATES", "TETRIS"]

    getNotes = function() {
       ent:current_beat < ent:songs[ent:playlist[ent:current_song]].length() => 
           ent:songs[ent:playlist[ent:current_song]][ent:current_beat.klog("index") ] | null
    }

  }

          rule importURL {
            select when testing importURL
            pre {
              song = http:get(event:attr("url"))
            }
              send_directive("song")
                with body = song
            always {
            
            }
          }

          rule importSong {
            select when testing importSong
            pre {
              n = event:attr("name");
              t = event:attr("track").decode();
              s = t.collect(function(a){(1 == 1) => n | "nothing"})
            }
              noop()
            always {
              raise explicit event "loadSong"
                with song = s
                if (ent:playlist.index(n) < 0 && t.length() > 0);
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
          
          rule playSong {
              select when testing playSong
                foreach getNotes().klog("notes") setting (note)
              pre {}
              if (not note.isnull() && not paths[note].isnull() && ent:event_count == 0) then
                playSound:play(paths[note])
              always {
                ent:current_beat := (ent:event_count != 0) => ent:current_beat | 
                    ((ent:current_beat < ent:songs[ent:playlist[ent:current_song]].length() - 1) => ent:current_beat + 1 | 0) on final;
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
                    ((ent:current_beat > 0) => ent:current_beat - 1 | ent:songs[ent:playlist[ent:current_song]].length() - 1) on final;
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

          rule resetPlaylist {
            select when testing resetPlaylist 
              noop()
            always{
              ent:songs := default_songs;
              ent:playlist := default_playlist;
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
              ent:current_song := 0
            }
          }
              
}