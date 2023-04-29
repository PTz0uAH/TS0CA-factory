<?php
//L.S. Hoi Amiga lovers.. this worked for me at my AmiGoXPE developer site..
//a https webserver + php-server is mandatory to test it..
//create a dir in the ROOT named TS0CA..
//upload TS0CA.zip + install.php (this file) to the dir just created..
//unpack the Zip-archive by calling this script (example; https://yourdomain.extension/TS0CA/install.php
$zip = new ZipArchive;
if ($zip->open('TS0CA.zip') === TRUE) {
 $zip->extractTo('.');
 $zip->close();
 echo 'Unzip Process Successful!';
 //if success remove this install.php from your server
 //adapt .htaccess if needed
 //now you can call https://yourdomain.extension/TS0CA/AmiGoDOS.php
 //AmiGoDOS is developed with Kickstart3.1 in mind and uses
 //the latest Firefox as WebMIDI compatible reference browser..
 //perhaps a fork will be made later to implement Chromium alike APIs
 //as requested by a "Rusty A1000 user"
 //thank you for keeping "The Spirit Of Commodore Amiga" alive..
 //remember to issue the command "lic" in the shell for all credits..
 //and to find out if you are also a "legit" TS0CA user..
 //this install is a proofofconceptofproof and edu example
 //only to be updated if the learning curve needs to be adapted..
 //learn the ins and out for yourself by reading the comments
 //at every PTz0uAH/AmiGoDOS commit..
 //have fun beta-testing AmiGoDOS (TS0CA)
 //with kind regards, PTz(Peter Slootbeek)uAH
} else {
 echo 'Unzip Process failed! Please check your PHP server settings..';
}
?>