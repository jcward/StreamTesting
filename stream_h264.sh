vlc ~/Downloads/BigBuckBunny_DivX_HD720p_ASP.divx --sout '#transcode{vcodec=h264,vb=4096,acodec=mp3,ab=128,samplerate=44100}:std{access=http{mime=video/x-flv},mux=ffmpeg{mux=flv},dst=0.0.0.0:8081/stream.flv}'
