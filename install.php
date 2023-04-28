<?php
//this worked for me at my AmiGoXPE developer site..
//a https webserver + php-server is mandatory
//create a dir in the ROOT named TS0CA..
//upload TS0CA.zip + install.php (this file) to the dir just created..
//unpack the Zip-archive by calling this script (example; https://yourdomain.net/TS0CA/install.php
$zip = new ZipArchive;
if ($zip->open('TS0CA.zip') === TRUE) {
 $zip->extractTo('.');
 $zip->close();
 echo 'Unzip Process Successful!';
 //if success remove this install.php from your server
 //adapt .htaccess if needed
 //now you can call https://yourdomain.net/TS0CA/AmiGoDOS.php
 //AmiGoDOS is developed with Kickstart3.1 in mind and uses
 //the latest Firefox as reference browser..
 //thank you for keeping "The Spirit Of Commodore Amiga" alive..
 //remember to issue the command "lic" in the shell for all credits..
 //and to find out if you are a "legit" TS0CA user..
 //have fun beta-testing AmiGoDOS (TS0CA)
 //with kind regards, PTz(Peter Slootbeek)uAH
} else {
 echo 'Unzip Process failed! Please check your PHP server settings..';
}
?>