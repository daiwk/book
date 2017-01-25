#!/bin/bash

input_md=$1
res_md=$2
toc_md=tmp_toc.md

cat $input_md | ./gh-md-toc - > $toc_md
sed -i '1d' $toc_md
sed -i 's/^      //g' $toc_md

csplit  -f "tmp_" $input_md /=======/1

cat tmp_00 $toc_md tmp_01 > $res_md

uname=`uname -a`
if [[ $uname =~ 'MINGW64' ]]; then

    dos2unix -n $res_md ${res_md}.unix

fi
