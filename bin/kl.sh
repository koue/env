#!/bin/sh
/usr/local/bin/setxkbmap -print | grep us
if [ $? -eq 0 ]
then
        /usr/local/bin/setxkbmap bg phonetic
else
        /usr/local/bin/setxkbmap us
fi
