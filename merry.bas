10 REM Merry Christmas RC2014
20 REM rc2014-ym2149 and ZX True Tone

30 REM Clear Background
40 PRINT CHR$(27);"[48;5;018m" : REM Background Dark Blue
45 PRINT CHR$(27);"[?;25l" : REM Hide cursor
50 CLS

60 REM Load in bitmap data to sprite
70 REM Set transparent sprites
80 PRINT CHR$(27);"[58;5;0m";
90 PRINT CHR$(27);"[=2m";

100 REM Set up input for bitmap
110 PRINT CHR$(27);"[#0;15;15;10a";

120 REM Read in sprite from data
130 FOR N = 1 TO 15
140 READ C$
150 PRINT C$;
160 NEXT

200 REM Setup the background graphic

210 REM T1 - 60 wide
220 PRINT CHR$(27);"[38;5;118m";
230 PRINT CHR$(27);"[#320;37;260;141l";
240 PRINT CHR$(27);"[#320;37;380;141l";
250 PRINT CHR$(27);"[#260;141;280;141l";
260 PRINT CHR$(27);"[#380;141;360;141l";

280 REM T2 - 100 wide
290 PRINT CHR$(27);"[#280;141;220;237l";
300 PRINT CHR$(27);"[#360;141;420;237l";
310 PRINT CHR$(27);"[#220;237;240;237l";
320 PRINT CHR$(27);"[#420;237;400;237l";

330 REM T3 - 140 wide,
340 PRINT CHR$(27);"[#240;237;180;332l";
350 PRINT CHR$(27);"[#400;237;460;332l";
360 PRINT CHR$(27);"[#180;332;460;332l";

370 REM Draw trunk
380 PRINT CHR$(27);"[38;5;052m";
390 PRINT CHR$(27);"[#300;333;40;55R";

400 REM Draw base
410 PRINT CHR$(27);"[38;5;196m";
420 PRINT CHR$(27);"[#250;389;390;389l";
430 PRINT CHR$(27);"[#275;444;365;444l";
440 PRINT CHR$(27);"[#250;389;275;444l";
450 PRINT CHR$(27);"[#390;389;365;444l";

500 REM Add Baubles
510 PRINT CHR$(27);"[38;5;220m";
520 PRINT CHR$(27);"[#380;151;10c";
530 PRINT CHR$(27);"[#260;151;10c";
540 PRINT CHR$(27);"[#220;247;10c";
550 PRINT CHR$(27);"[#420;247;10c";
560 PRINT CHR$(27);"[#180;342;10c";
570 PRINT CHR$(27);"[#460;342;10c";

600 REM Seed sprite locations, disp screen
610 DIM S(8, 2)
620 FOR G = 1 TO 8
630 S(G, 1) = INT(RND(1) * 76)+5+((G-1)*80)
640 S(G, 2) = INT(RND(1) * 100)+20
645 GOSUB 2000
650 PRINT CHR$(27);"[#";Z$;";0;"X$;";";Y$;"s";
660 NEXT

700 REM Define notes
710 REM Note Order "DEFGAB"
720 L = 2000
730 DIM CT(7) : REM Coarse Tone
740 FOR N= 1 TO 7 : READ CT(N) : NEXT N
750 DIM FT(7)
760 FOR N=1 TO 7 : READ FT(N) : NEXT N

800 REM Play Demo
810 R=216
820 D=208
830 OUT R,7 : REM select the mixer register
840 OUT D,62 : REM enable channel A only

850 FOR N=1 TO 30
860 OUT R,8 : REM channel A volume
870 OUT D,15 : REM set it to maximum
880 READ I : READ U : REM index, dur
890 OUT R, 0 : REM set channel A FT
900 OUT D, FT(I)
910 OUT R, 1 : REM set channel A CT
920 OUT D, CT(I)

930 REM Move the snowflakes here on note iteration
940 FOR M = 1 TO U
950 REM Update sprite positions
960 FOR G = 1 TO 8
970 S(G,1) = S(G,1) + INT((RND(1)-0.5) * RND(1)*10)
975 S(G,2) = S(G,2) + INT(RND(1)*10)+5
980 IF RND(1) < .02 THEN S(G,2) = INT(RND(1)*100)+20
990 GOSUB 2000
1000 PRINT CHR$(27);"[#";Z$;";"X$;";";Y$;"m";
1010 NEXT
1020 NEXT

1030 OUT R,8 : REM channel A volume
1040 OUT D,0 : REM set it to none

1050 FOR M=1 TO L / 100 : NEXT : REM Wait

1060 NEXT : REM next note

1200 REM Sprite data
1210 DATA "0;0;0;0;0;15;0;15;0;15;0;0;0;0;0;"
1220 DATA "0;0;15;0;0;0;15;15;15;0;0;0;15;0;0;"
1230 DATA "0;15;15;0;0;0;0;15;0;0;0;0;15;15;0;"
1240 DATA "0;0;0;15;0;0;15;15;15;0;0;15;0;0;0;"
1250 DATA "0;0;0;0;15;0;0;15;0;0;15;0;0;0;0;"
1260 DATA "15;0;0;0;0;15;15;15;15;15;0;0;0;0;15;"
1270 DATA "0;15;0;15;0;15;0;0;0;15;0;15;0;15;0;"
1280 DATA "15;15;15;15;15;15;0;0;0;15;15;15;15;15;15;"
1290 DATA "0;15;0;15;0;15;0;0;0;15;0;15;0;15;0;"
1300 DATA "15;0;0;0;0;15;15;15;15;15;0;0;0;0;15;"
1310 DATA "0;0;0;0;15;0;0;15;0;0;15;0;0;0;0;"
1320 DATA "0;0;0;15;0;0;15;15;15;0;0;15;0;0;0;"
1330 DATA "0;15;15;0;0;0;0;15;0;0;0;0;15;15;0;"
1340 DATA "0;0;15;0;0;0;15;15;15;0;0;0;15;0;0;"
1350 DATA "0;0;0;0;0;15;0;15;0;15;0;0;0;0;0;"

1360 REM Coarse Tone
1370 DATA 1,1,1,1,0,0,0
1380 REM Fine Tone
1390 DATA 122,81,44,27,252,225,212

1400 REM Note:Duration
1410 DATA 1,2,4,2,4,1,5,1,4,1,3,1,2,2,2,2
1420 DATA 2,2,5,2,5,1,6,1,5,1,4,1,3,2,1,2
1430 DATA 1,2,6,2,6,1,7,1,6,1,5,1,4,2,2,2
1440 DATA 1,1,1,1,2,2,5,2,3,2,4,4

1900 GOTO 3000 : REM Terminate

2000 REM Set X,Y for sprite and trim string
2010 X$=STR$(S(G, 1))
2020 Y$=STR$(S(G, 2))
2030 Z$=STR$(G)
2040 X$=RIGHT$(X$,LEN(X$)-1) : REM Remove sign
2050 Y$=RIGHT$(Y$,LEN(Y$)-1) : REM Remove sign
2060 Z$=RIGHT$(Z$,LEN(Z$)-1) : REM Remove sign
2070 RETURN

3000 REM End
3010 PRINT CHR$(27);"[=0m"; : REM Reset cursor
3020 PRINT CHR$(27);"[48;5;018m"; : REM Background Black
3030 PRINT CHR$(27);"[38;5;166m" : REM Foreground Orange
3040 PRINT CHR$(27);"[10;26H"; : REM Set cursor position
3050 PRINT "Merry Christmas & Happy New Year";
3060 PRINT CHR$(27);"[11;32H"; : REM Set cursor position
3070 PRINT "From Tentacle Towers";
3080 PRINT CHR$(27);"[=0m"; : REM Reset colour
3090 PRINT CHR$(27);"[?25b"; : REM Show cursor
3080 PRINT CHR$(27);"[0;25H"; : REM Set cursor position