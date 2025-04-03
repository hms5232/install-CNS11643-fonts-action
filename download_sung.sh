#!/bin/bash


while getopts 'f:' flag; do
  case "${flag}" in
    f) flags="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

wget -O Fonts_Sung.zip ${flags} https://www.cns11643.gov.tw/opendata/Fonts_Sung.zip

# let's hash it~
# but we don't have offical sha1sum file Orz
hash=$(sha1sum Fonts_Sung.zip | cut -d ' ' -f 1)
echo -e "\n The SHA1 value of downloaded file is \n"
echo -e "\t>>>>> $hash <<<<<\n"

if [ ! -d "sung/" ] ; then
  mkdir sung
fi

unzip Fonts_Sung.zip -d sung

cp -i sung/TW-Sung-*.ttf $HOME/.fonts
