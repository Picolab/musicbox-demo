ruleset player {
  meta {
    shares __testing
  }

  global {
    __testing = { "queries": [ { "name": "__testing" } ],
                  "events": [{ "domain": "testing", "type": "playSong" },
                             { "domain": "testing", "type": "playBackward" },
                             { "domain": "testing", "type": "nextSong" },
                             { "domain": "testing", "type": "resetSong" },
                             { "domain": "testing", "type": "resetPlaylist" } ] }

    directory = "/notes/"
    
    paths = {
                "R": directory+"silence.mp3",
                "C4": directory+"C4.mp3",
                "C#4": directory+"C#4.mp3",
                "D4": directory+"D4.mp3", 
                "D#4": directory+"D#4.mp3", 
                "E4": directory+"E4.mp3", 
                "F4": directory+"F4.mp3", 
                "F#4": directory+"F#4.mp3", 
                "G4": directory+"G4.mp3", 
                "G#4": directory+"G#4.mp3", 
                "A4": directory+"A4.mp3", 
                "A#4": directory+"A#4.mp3",
                "B4": directory+"B4.mp3", 
                "C5": directory+"C5.mp3",
                "C#5": directory+"C#5.mp3",
                "D5": directory+"D5.mp3", 
                "D#5": directory+"D#5.mp3", 
                "E5": directory+"E5.mp3", 
                "F5": directory+"F5.mp3",
                "F#5": directory+"F#5.mp3", 
                "G5": directory+"G5.mp3", 
                "G#5": directory+"G#5.mp3", 
                "A5": directory+"A5.mp3", 
                "A#5": directory+"A#5.mp3",  
                "B5": directory+"B5.mp3", 
                "C6": directory+"C6.mp3",
                "C#6": directory+"C#6.mp3",
                "D6": directory+"D6.mp3", 
                "D#6": directory+"D#6.mp3", 
                "E6": directory+"E6.mp3", 
                "F6": directory+"F6.mp3", 
                "F#6": directory+"F#6.mp3", 
                "G6": directory+"G6.mp3",
                "G#6": directory+"G#6.mp3",
                "A6": directory+"A6.mp3", 
                "A#6": directory+"A#6.mp3", 
                "B6": directory+"B6.mp3", 
                "C7": directory+"C7.mp3",
                "C#7": directory+"C#7.mp3",
                "D7": directory+"D7.mp3", 
                "D#7": directory+"D#7.mp3", 
                "E7": directory+"E7.mp3", 
                "F7": directory+"F7.mp3", 
                "F#7": directory+"F#7.mp3", 
                "G7": directory+"G7.mp3",
                "G#7": directory+"G#7.mp3",
                "A7": directory+"A7.mp3", 
                "A#7": directory+"A#7.mp3", 
                "B7": directory+"B7.mp3", 
                "C8": directory+"C8.mp3"
                }

    songs = {
        "JACK" : [
["G#4","G#5"],["C5"],["D#5","G#5"],["A#4","A#5"],["C#5"],["F5","A#5"],["C5","C6"],["D#6"]
,["C5","C6"],["G#5"],["D#5"],["D#5","C5"],["G#4","G#5"],["C5"],["D#5","G#5"],["A#4","A#5"],["F5"],["A#4","A#5"]
,["C5","C6"],["D#5"],["G5"],["G#5"],["D#5"],["D#5","C5"],["G#4","G#5"],["C5"],["D#5","G#5"],["A#4","A#5"]
,["C#5"],["F5","A#5"],["C5","C6"],["D#6"],["C5","C6"],["G#5"],["D#5"],["C5"],["A#4","C#5","F5","A#5","C#6","F6"]
,["R"],["R"],["A#5"],["F5"],["C#5","C#6"],["D#5","C6"],["G5"],["D#5"],["G#4","G#5"],["R"],["R"]
        ],

        "SCALE" : [
["C4"],["C#4"],["D4"],["D#4"],["E4"],["F4"],["F#4"],["G4"],["G#4"],["A4"],["A#4"],["B4"],
["C5"],["C#5"],["D5"],["D#5"],["E5"],["F5"],["F#5"],["G5"],["G#5"],["A5"],["A#5"],["B5"],
["C6"],["C#6"],["D6"],["D#6"],["E6"],["F6"],["F#6"],["G6"],["G#6"],["A6"],["A#6"],["B6"],
["C7"],["C#7"],["D7"],["D#7"],["E7"],["F7"],["F#7"],["G7"],["G#7"],["A7"],["A#7"],["B7"],
["C8"]
        ]

    }

    playlist = ["JACK", "SCALE"]

    getNotes = function() {
       //ent:songs.index(ent:current_song).index(ent:current_beat) // return current notes

       ent:current_beat < songs[playlist[ent:current_song]].length() => songs[playlist[ent:current_song]][ent:current_beat.klog("index") ] | null
    }

  }

          
          rule playSong {
              select when testing playSong
                foreach getNotes().klog("notes") setting (note)
              pre {}
              if (not note.isnull()) then
                playSound:play(paths[note])
              fired {
                ent:current_beat := (ent:current_beat < songs[playlist[ent:current_song]].length() - 1) => ent:current_beat + 1 | 0 on final
              } 
          }

          rule playBackward {
              select when testing playBackward
                foreach getNotes().klog("notes") setting (note)
              pre {}
              if (not note.isnull()) then
                playSound:play(paths[note])
              fired {
                ent:current_beat := (ent:current_beat > 0) => ent:current_beat - 1 | songs[playlist[ent:current_song]].length() - 1 on final
              } 
          }

          rule nextSong {
            select when testing nextSong 
              noop()
            always{
              ent:current_beat := 0;
              ent:current_song := (ent:current_song < playlist.length() - 1) => ent:current_song + 1 | 0
            }
          }

          rule resetSong {
            select when testing resetSong
              noop()
            always{
              ent:current_beat := 0
            }
          }

          rule resetPlaylist {
            select when testing resetPlaylist 
              noop()
            always{
              ent:current_beat := 0;
              ent:current_song := 0
            }
          }
}