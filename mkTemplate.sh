#! /bin/bash

projectName=$2
path=$HOME/Documents/Git/ErreKappa1/MakeTemplate/Make_Templates

cFunc () {
	echo all: > Makefile
	echo "	gcc -Wall -g *.h *.c -o x"$projectName >> Makefile
	cp $path/C/generic.c ./
	mv generic.c $projectName.c
}

cppFunc () {
	echo all: > Makefile
	echo "	g++ -Wall -Wextra -g *.cpp -std=c++11 -o x"$projectName >> Makefile
	cp $path/C++/generic.cpp ./
	mv generic.cpp $projectName.cpp
}

shFunc () {
	echo "#! /bin/sh" > ./$projectName.sh
}

mdFunc () {
	cp -r $path/templatePandocIts/ ./$projectName
	cd ./$projectName
	mv esempio_cover_pdf.md $projectName.md
	rm README.md howToCompile.sh
}

helpFunc () {
	echo
	echo Usage: mktemplate [OPTION] DIRNAME
	echo
	echo \	\	Create a directory that contain some basic settings for the\
		selected language as well as an empty file
	echo
	echo DIRNAME: 
	echo \	\	Need to be the name of the project with a capital letter at the\
		beginning
	echo
	echo OPTION:
	echo \	\	-c\	Create a template for the C language
	echo \	\	-cpp\	Create a template for the C++ language std=c++11
	echo \	\	-sh\	Create a template for a bash script
	echo \	\	-md\	Create a template for a markdown document using the ITS\
		template
	echo \	\	-h\	--help\	\	Display this help and exit
	echo
	echo Example:
	echo \	\	mktemplate -cpp Newproject
	exit 0
}

genericError () {
	echo mkTemplate: invalid arguments
	echo try \'mkTemplate --help\' for more information.
	exit 1
}

if [ -z $1 ]
then
	genericError
elif [ $1 == '-h' ] || [ $1 == '--help' ]
then
	helpFunc
fi
if [[ $# -lt 2 ]]
then
	genericError
fi
if [ $1 == '-c' ]
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
elif [ $1 == '-md' ]
then
	mdFunc
	exit 0
else 
	echo mkTemplate: invalid argument
	echo try \'mkTemplate --help\' for more information.
	exit 1
fi
