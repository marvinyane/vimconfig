#!/bin/sh

if [ $# -eq 0 ]; then
    mkdir .vimconfig
    touch .vimpro
    echo SourceDir:`pwd` > .vimpro
fi



find . -type d | xargs realpath | grep -v .git | grep -v .vimconfig | sed -e "s/\(.*\)/-I\1/" > .clang_complete
cd .vimconfig
find `pwd`/../  -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files
if [ "$1" = "-a" ]; then
    find `pwd`/../$2 -type f | xargs realpath >> cscope.files
    find `pwd`/../$2 -type d | xargs realpath | sed -e "s/\(.*\)/-I\1/" >> ../.clang_complete
fi
cscope -Rbq -i cscope.files
ctags -R --c-kinds=+lpx --c++-kinds=+lpx --fields=+iaS --extra=+q -L cscope.files
cd ..
