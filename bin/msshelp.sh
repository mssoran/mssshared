#!/bin/zsh

# iterm2 can use rgb colors
# To understand if iterm2 is runnin, use 
# [[ "$TERM_PROGRAM" == "iTerm.app" ]]
# Then set color as '\033[0;38;2;200;0;0m' where (r,g,b) is (2,200,0), replace first 0 with 1 for bold etc 

# define some colors to use
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Reset
ResetColor='\033[0m'      # Text Reset

function notifyExit {
    echo -e ${BRed}"**************************************************"${ResetColor}
    echo -e ${BRed}"**************************************************"${ResetColor}
    echo -e ${BRed}"**************************************************"${ResetColor}
    echo -e ${BRed}"$*"${ResetColor}
    echo -e ${BRed}" "${ResetColor}
    echo -e ${BRed}"Please open a new terminal window and restart the script!"${ResetColor}
    echo -e ${BRed}"**************************************************"${ResetColor}
    echo -e ${BRed}"**************************************************"${ResetColor}
    echo -e ${BRed}"**************************************************"${ResetColor}
    exit 12
}



function askQuestion {
	echo aha
    if [[ "$allYes" == "true" ]]; then return 0; fi
	echo aha
    if [[ "$talkToMe" == "true" ]]; then say --rate 350 "$1" &
fi
    echo $1 "[y/s/N]?"
    read answer
    if [[ "$answer" == 'y' ]]; then {
        return 0
    } else if [[ "$answer" == 's' ]]; then return 1; else return 5; fi;
fi
}


function askRun {
    questionText=$1
    shift
    echo -e ${BYellow} ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ---------------------------------------------------------------------
    echo ---------------------------------------------------------------------
    echo ""
    echo ""
    echo ""
    echo Here is the command to run:
    echo "               $*"
    echo ""
    echo -e "" ${ResetColor}
    askQuestion "$questionText"
    result=$?
    if [[ "$result" == "0" ]]; then (
        echo running the command:
        $*
        commandResult=$?
        if [[ "$commandResult" != "0" ]]; then {
            echo -e ${BRed}The result is ----- ${commandResult}  Error ----- Failed${ResetColor}
        } else {
            echo -e ${BYellow}The result is ----- ${commandResult} -----${ResetColor}
        } fi
    ) else if [[ "$result" != "1" ]]; then exit 1; else echo Skipping this command; fi; fi
}

function createDir {
    if [[ -d "$1" ]] ; then echo -e ${Green}Directory "$1" already exists ${ResetColor}
    else {
        echo -e ${BYellow}Creating directory "$1" ${ResetColor} 
        mkdir -p "$1"
    } fi
}
