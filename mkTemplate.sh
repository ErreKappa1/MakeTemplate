#! /bin/bash

projectName=$2

cFunc () {
	echo all: > Makefile
	echo "	gcc -Wall -g *.h *.c -o x"$projectName >> Makefile
	cp $HOME/Documents/Git/ErreKappa1/MakeTemplate/Make_Templates/C/generic.c ./
	mv generic.c $projectName.c
}

cppFunc () {
	echo all: > Makefile
	echo "	g++ -Wall -Wextra -g *.cpp -std=c++11 -o x"$projectName >> Makefile
	cp $HOME/Documents/Git/ErreKappa1/MakeTemplate/Make_Templates/C++/generic.cpp ./
	mv generic.cpp $projectName.cpp
}

shFunc () {
	echo "#! /bin/sh" > ./$projectName.sh
}

helpFunc () {
	echo
	echo Usage: mktemplate [OPTION] DIRNAME
	echo
	echo \	\	Create a directory that contain some basic settings for the selected language as well as an empty file
	echo
	echo DIRNAME: 
	echo \	\	Need to be the name of the project with a capital letter at the beginning
	echo
	echo OPTION:
	echo \	\	-c\	Create a template for the C language
	echo \	\	-cpp\	Create a template for the C++ language std=c++11
	echo \	\	-sh\	Create a template for a bash script
	echo \	\	-h\	--help\	\	Display this help and exit
	echo
	echo Example:
	echo \	\	mktemplate -cpp Newproject
}

genericError () {
	echo mkTemplate: invalid arguments
	echo try \'mkTemplate --help\' for more information.
	exit 1
}

if [[ $# -lt 2 ]]
then
	genericError
fi
if [ -z $1 ]
then
	genericError
elif [ $1 == '-h' ] || [ $1 == '--help' ]
then
	helpFunc
	cd 
	exit 0
elif [ $1 == '-c' ]
then
	mkdir $projectName && cd $projectName && cFunc
	exit 0
elif [ $1 == '-cpp' ]
then
	mkdir $projectName && cd $projectName && cppFunc
	exit 0
elif [ $1 == '-sh' ]
then
	shFunc
	exit 0
else 
	echo mkTemplate: invalid argument
	echo try \'mkTemplate --help\' for more information.
	exit 1
fi
