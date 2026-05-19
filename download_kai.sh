#!/bin/bash


while getopts 'f:' flag; do
  case "${flag}" in
    f) flags="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [ -f "Fonts_Kai.zip" ]; then
  echo "Use exists Fonts_Kai.zip"
else
  wget -O Fonts_Kai.zip ${flags} https://www.cns11643.gov.tw/opendata/Fonts_Kai.zip
fi

# let's hash it~
# but we don't have offical sha1sum file Orz
hash=$(sha1sum Fonts_Kai.zip | cut -d ' ' -f 1)
echo -e "\n The SHA1 value of downloaded file is \n"
echo -e "\t>>>>> $hash <<<<<\n"

if [ ! -d "kai/" ] ; then
  mkdir kai
fi

unzip Fonts_Kai.zip -d kai

cp -i kai/TW-Kai-*.ttf $HOME/.fonts
