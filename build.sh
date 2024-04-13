#!/bin/sh
# TS0CA-factory.. summoning The Spirit 0f Commodore Amiga ;-)
# USAGE: ./build.sh [DISTRI_NAME/S] (defaults to TS0CA)
# SHORT: ON-THE-FLY CREATION OF TS0CA-BETA RC
# DESCR: build a TS0CA distri for easy deployment and testing
# MANDATORY: to execute this script you need a Debian Flavoured OS
# DEPLOY2: HTTP(S) server + PHP(8+) for AmiGoDOS TAWS integration
# FEATURES: latest vAmigaWeb v2.6beta + AmiGoDOS Developer Shell 
# AUTH: 1PTz(Peter Slootbeek)uAH20NaCl..v/hL8-T&~
# COMMENT: "Just my 2cts to keep the momentum going.." 
BUILD_NAME="${1:-TS0CA}"
ZIP_TARGET="${BUILD_NAME}_latest.zip"
SAVE1="vAmigaWeb.github.io-main.zip"
GET1="https://github.com/vAmigaWeb/vAmigaWeb.github.io/archive/refs/heads/main.zip"
SAVE2="jquery.terminal-2.39.3.zip"
GET2="https://github.com/jcubic/jquery.terminal/archive/refs/tags/2.39.3.zip"
SRC_DIR1="./source/vAmigaWeb.github.io-main"
SRC_DIR2="./source/jquery.terminal-2.39.3"
BUILD_DIR="./build/$BUILD_NAME"
EXCLUDE_VAMIGAWEB="--exclude=.git* --exclude=doc --exclude=manifest.json --exclude=run*"
EXCLUDE_JQUERY_TERMINAL="--exclude=.* --exclude=__tests__ --exclude=assets --exclude=bin --exclude=examples --exclude=*.json --exclude=C* --exclude=files --exclude=Makefile --exclude=jest.* --exclude=*.ts --exclude import.html --exclude=manifest --exclude=scripts --exclude=templates"
if [ -e "./source/$SAVE1" ]
then
	echo "Archive $SAVE1 exists.. skipping download.."
else
	echo "Downloading $SAVE1 to ./source/"
	wget -q -P./source/ -O./source/$SAVE1 $GET1
fi
if [ -e "./source/$SAVE2" ]
then
	echo "Archive $SAVE2 exists.. skipping download.."
else
	echo "Downloading $SAVE2 to ./source/"
	wget -q -P./source/ -O./source/$SAVE2 $GET2
fi
echo "Cleanup ./source/ environment.."
rm -Rf $SRC_DIR1
rm -Rf $SRC_DIR2
echo "Unpack latest source-archives.."
unzip -q ./source/$SAVE1 -d ./source/
unzip -q ./source/$SAVE2 -d ./source/

echo "#!/bin/sh" >job.sh
echo "rm -Rf $BUILD_DIR" >>job.sh
echo "mkdir $BUILD_DIR" >>job.sh
echo "mkdir $BUILD_DIR/adf" >>job.sh
if [ -e "$HOME/.local/bin/xdftool" ]
then
	echo "echo \"Creating empty Projects ADF (880KB ffs)..\" " >>job.sh
	echo "xdftool $BUILD_DIR/adf/projects.adf format Projects ffs" >>job.sh
#	CUSTOMIZE THE BUILD IF NEEDED
#	echo "zip -j $BUILD_DIR/adf/wb31-install.zip $HOME/.amiga/adf/wb31*.adf" >>job.sh
else
	echo "echo Please install AmiTools to use create-adf-on-the-fly feature.." >>job.sh
fi
echo "mkdir $BUILD_DIR/hdf" >>job.sh
if [ -e "$HOME/.local/bin/rdbtool" ]
then
	echo "echo \"Create empty Amiga HardDisk File (204 MB raw rdb)..\" " >>job.sh
	echo "rdbtool $BUILD_DIR/hdf/harddisk1.hdf create size=204Mi + init" >>job.sh
	echo "echo \"Create first partition (51MB)..\" " >>job.sh
	echo "rdbtool $BUILD_DIR/hdf/harddisk1.hdf add size=25%" >>job.sh
	echo "echo \"Create second partition (153MB)..\" " >>job.sh
	echo "rdbtool $BUILD_DIR/hdf/harddisk1.hdf add size=75%" >>job.sh
	echo "zip -j $BUILD_DIR/hdf/harddisk1.zip $BUILD_DIR/hdf/harddisk1.hdf" >>job.sh
	echo "rm $BUILD_DIR/hdf/harddisk1.hdf" >>job.sh
#	echo "echo \"step0: Feed vAmigaWeb the 3.1 ROM it needs to boot\" " >>job.sh
#	echo "echo \"step1: Boot vAmigaWeb with wb-31-install.zip\" " >>job.sh
#	echo "echo \"step2: format the 2 partitions of harddisk1.. i.e. SYSTEM and WORK..\" " >>job.sh
else
	echo "echo Please install AmiTools to use create-hdf-on-the-fly feature.." >>job.sh
fi
echo "mkdir $BUILD_DIR/licenses" >>job.sh
echo "rsync -r $EXCLUDE_VAMIGAWEB ${SRC_DIR1}/ ${BUILD_DIR}/" >>job.sh
echo "mv $BUILD_DIR/README.md $BUILD_DIR/licenses/vAmigaWeb_README.md" >>job.sh
echo "rsync -r $EXCLUDE_JQUERY_TERMINAL ${SRC_DIR2}/ ${BUILD_DIR}/" >>job.sh
echo "mv $BUILD_DIR/README.md $BUILD_DIR/licenses/JQuery_Terminal_README.md" >>job.sh
echo "mv $BUILD_DIR/LICENSE $BUILD_DIR/licenses/JQuery_Terminal_LICENSE" >>job.sh
echo "sed -i 's@https://vamigaweb.github.io@.@g' $BUILD_DIR/js/vAmigaWeb_player.js" >>job.sh
echo "sed -i 's@document.getElementById(\"vAmigaWeb\").onload = this.grab_focus;@//document.getElementById(\"vAmigaWeb\").onload = this.grab_focus;@g' $BUILD_DIR/js/vAmigaWeb_player.js" >>job.sh
echo "unzip -q ./extras/assets.zip -d $BUILD_DIR/" >>job.sh
echo "mv $BUILD_DIR/htaccess $BUILD_DIR/.htaccess" >>job.sh
echo "wget -q -P$BUILD_DIR https://raw.github.com/PTz0uAH/AmiGoDOS/main/AmiGoDOS.php" >>job.sh
echo "echo Packing $BUILD_DIR" >>job.sh
echo "cd ./build/" >>job.sh
echo "rm -Rf ./$ZIP_TARGET" >>job.sh
echo "zip -r -q ./$ZIP_TARGET $BUILD_NAME" >>job.sh
chmod +x job.sh
./job.sh
if [ -e "./build/$ZIP_TARGET" ]
then
	echo "Successfully created $ZIP_TARGET"
else
	echo "Failed to create $ZIP_TARGET"
fi
# manual install: copy TS0CA.zip to the http(s)-server root and unpack.. i.e. localhost..
# remote install: create a script to upload and unpack the archive on your http(s)-server 
# if you run "just" a http server like tiny-web.. you can configure Chromium to treat its url as secure..
# otherwise you will not have Amiga-audio.. if using another browser, please find an equivalent setting..
# good luck betatesting and have fun resurrecting ==1..123PTz("The Spirit 0f Commodore Amiga")uAH.. 
