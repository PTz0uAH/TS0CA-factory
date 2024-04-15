Lectori Salutem..

==1..123PTz("Commodore Amiga.. hast du keinen.. bau dir einen..")uAH?

Back in the day the analog radio signals from our "occupied" neighbours reached even our country..
With the right antenna the radio hobby enriched our lives.. growing up as teens in the "free world"..
All kinds of european stations could be received.. even police, fire.dept and airtraffic..
Such openness created an instant virtual bond between the people..

One day a commercial was broadcasted which caught my attention..
Its loudness clearly overwhelmed the standard volume level of any other commercial..
With a stereotypical nasal germanic voice the message was clear.. "If you ain't got one.. get one!" freely translated..

Slightly adapted it became the slogan/credo for the TS0CA-factory project..

TS0CA-factory builds your private webbased Amiga emulation environment PLUS AmiGoDOS developer Shell..

AmiGoDOS.php controls vAmigaWeb and gives the Amiga-student a CLI to various implementations of the Amiga SER: port..

AmiGoDOS "NewShell" handles: AUX:(default)/WebSerial/WebMIDI/WebSocket and more (WIP)..

To build/test/deploy TS0CA on-the-fly you need to have a webserver: i.e. apache2 + php..

Extra features are auto-enabled if you have a working AmiTools environment..

AmiTools adds instant creation of adf/hdf (https://github.com/cnvogelg/amitools)..

To get vAmigaWeb running you need a proper kickstart rom (bought/borrowed or extracted from your real Amiga)

A full TS0CA build includes an empty Projects floppy plus an empty real rdb harddisk with 2 partitions..

You need an OS3.x WB-install disk to boot vAmigaWeb 68E020/14Mhz to format the harddisk for OS3.x install..

Todo: implement a build-option to auto-magically include a pre-build/configured DOpus5.92 Maghellan II (vAmigaWeb edition)..

"Stay tuned for more"

TS0CA DIY.. ABC.. 123.. OS: Debian11/12/WSL..
1) git clone https://github.com/PTz0uAH/TS0CA-factory.git
2) cd TS0CA-factory && chmod +x build.sh
3) ./build.sh

with kind regards.. PTz()uAH

example usage: chromium http(s)://192.168.0.123/TS0CA/AmiGoDOS.php
note: any questions? please study the sources for more information!
bugs: please report at AmiGoDOS issues..
disclaimer: usage at own risk!
