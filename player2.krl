ruleset player {
  meta {
    shares __testing, songs, state, song
  }

  global {
    __testing = { "queries": [ { "name": "__testing" },{"name": "songs"}, {"name":"state"}  ],
                  "events": [{ "domain": "testing", "type": "importURL", "attrs": ["url"] },
                             { "domain": "testing", "type": "setEventsPerBeat", "attrs": ["events_per_beat"] },
                             { "domain": "testing", "type": "playSong" },
                             { "domain": "testing", "type": "playBackward" },
                             { "domain": "testing", "type": "nextSong" },
                             { "domain": "testing", "type": "songStart" },
                             { "domain": "testing", "type": "playlistStart" },
                             { "domain": "testing", "type": "clearPlaylist" },
                             { "domain": "explicit", "type": "openDoor" } ] }
    state = function(){
       {
         "songs" : ent:songs ,
         "playlist" : ent:playlist ,
         "current_beat" : ent:current_beat ,
         "current_song" : ent:current_song ,
         "events_per_beat" : ent:events_per_beat
       }
    }
    songs = function(){ // by title 
       ent:playlist
    }
    currentSong = function(){
       ent:songs[ent:playlist[ent:current_song]]
    }

    getNotes = function() {
       current_song = currentSong();//.klog("currentSong");
       notes = current_song{"song"};
       ent:current_beat < notes.length() => notes[ent:current_beat /*.klog("index")*/] | null
    }

  }

          rule importURL {
            select when testing importURL
            pre {
              s = http:get(event:attr("url"))["content"].decode()
            }
              noop()
            always {
              raise explicit event "loadSong"
                with song = s
                if (ent:playlist.index(s.keys()[0]) < 0 && s.values()[0].length() > 0)
            }
          }

          rule loadSong {
            select when explicit loadSong
            pre {
              song = event:attr("song") // song is a map, <title>:<[notes]>
              new_song = {}.put(song.keys()[0], {"events_per_beat": 3}.put("song",song.values()[0]) )
            }
              noop()
            always{
              ent:songs := ent:songs.put(new_song);
              ent:playlist := ent:playlist.append(song.keys()[0]);
              ent:current_beat := 0;
              ent:current_song := ent:playlist.length() - 1
            }
          }

          rule setEventsPerBeat {
              select when testing setEventsPerBeat
              pre {
                epb = event:attr("events_per_beat")
                new_song = {}.put(ent:playlist[ent:current_song],currentSong().put("events_per_beat", epb))
              }
                noop()
              always {
                ent:songs := ent:songs.put(new_song);
                ent:event_count := 0;
                ent:events_per_beat := epb
              }
          }

          
          rule playSong {
              select when testing playSong
                foreach getNotes().append(null) setting (n)
              pre { /* notes = getNotes().klog("notes") */ 
a = (ent:current_beat < ent:songs[ent:playlist[ent:current_song]]{"song"}.length() - 1).klog("compare")
}
              if (ent:event_count == 0 && not n.isnull() ) then
                  playSound:play(n)
              always{
                ent:current_beat := (ent:event_count != 0) => ent:current_beat | 
                    ((ent:current_beat < ent:songs[ent:playlist[ent:current_song]]{"song"}.length() - 1) => ent:current_beat + 1 | 0) on final;
                ent:event_count := (ent:event_count < ent:events_per_beat - 1) => ent:event_count + 1 | 0 on final;
                raise explicit event "openDoor"
                  if (n == "O")
              } 
          }

          rule playBackward {
              select when testing playBackward
                foreach getNotes().append(null) setting (n)
              pre {
                //notes = getNotes().klog("notes")
           
              }
                if (ent:event_count == 0 && not n.isnull() ) then
                  playSound:play(n)
              always {
                ent:current_beat := (ent:event_count != 0) => ent:current_beat | 
                    ((ent:current_beat > 0) => ent:current_beat - 1 | ent:songs[ent:playlist[ent:current_song]].length() - 1) on final;
                ent:event_count := (ent:event_count < ent:events_per_beat - 1) => ent:event_count + 1 | 0 on final
              } 
          }

          rule play {
            select when explicit play
              foreach event:attr("to_play") setting (note)
            pre {}
              if (not note.isnull()) then
                playSound:play(note)
          }

        /*  rule openDoor {
            select when explicit openDoor
            pre {}
              send_directive("Open door")
            always {
              
            }
          }*/

          rule nextSong {
            select when testing nextSong 
              noop()
            always{
              ent:events_per_beat := currentSong(){"events_per_beat"};
              ent:current_beat := 0;
              ent:current_song := (ent:current_song < ent:playlist.length() - 1) => ent:current_song + 1 | 0
            }
          }

          rule playSong {
            select when testing playSong
            pre{
                title = event:attr("title")
                index = ent:playlist.index(title)
            } 
              noop()
            always{
              ent:events_per_beat := currentSong(){"events_per_beat"};
              ent:current_beat := 0;
              ent:current_song := (index == -1) => ent:current_song | index 
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
              ent:events_per_beat := 1
            }
          }
              
}
