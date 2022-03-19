
###### Declaration
```bash
# Text Reset
Color_Off=$'\033[0m'

# Regular Colors	         # Bold	                      # Underline	                # High Intensity	          # Bold High Intensity
Black=$'\033[0;30m'        	BBlack=$'\033[1;30m'       	UBlack=$'\033[4;30m'       	IBlack=$'\033[0;90m'       	BIBlack=$'\033[1;90m'
Red=$'\033[0;31m'          	BRed=$'\033[1;31m'         	URed=$'\033[4;31m'         	IRed=$'\033[0;91m'         	BIRed=$'\033[1;91m'
Green=$'\033[0;32m'        	BGreen=$'\033[1;32m'       	UGreen=$'\033[4;32m'       	IGreen=$'\033[0;92m'       	BIGreen=$'\033[1;92m'
Yellow=$'\033[0;33m'       	BYellow=$'\033[1;33m'      	UYellow=$'\033[4;33m'      	IYellow=$'\033[0;93m'      	BIYellow=$'\033[1;93m'
Blue=$'\033[0;34m'         	BBlue=$'\033[1;34m'        	UBlue=$'\033[4;34m'        	IBlue=$'\033[0;94m'        	BIBlue=$'\033[1;94m'
Purple=$'\033[0;35m'       	BPurple=$'\033[1;35m'      	UPurple=$'\033[4;35m'      	IPurple=$'\033[0;95m'      	BIPurple=$'\033[1;95m'
Cyan=$'\033[0;36m'         	BCyan=$'\033[1;36m'        	UCyan=$'\033[4;36m'        	ICyan=$'\033[0;96m'        	BICyan=$'\033[1;96m'
White=$'\033[0;37m'        	BWhite=$'\033[1;37m'       	UWhite=$'\033[4;37m'       	IWhite=$'\033[0;97m'       	BIWhite=$'\033[1;97m'


# Background	             # High Intensity backgrounds
On_Black=$'\033[40m'       	On_IBlack=$'\033[0;100m'
On_Red=$'\033[41m'         	On_IRed=$'\033[0;101m'
On_Green=$'\033[42m'       	On_IGreen=$'\033[0;102m'
On_Yellow=$'\033[43m'      	On_IYellow=$'\033[0;103m'
On_Blue=$'\033[44m'        	On_IBlue=$'\033[0;104m'
On_Purple=$'\033[45m'      	On_IPurple=$'\033[0;105m'
On_Cyan=$'\033[46m'        	On_ICyan=$'\033[0;106m'
On_White=$'\033[47m'       	On_IWhite=$'\033[0;107m'
```
##### Use
```bash
echo "$Blue I like chocolate cake"
echo "$Blue I$Red like$Purple chocolate$Color_Off cake"

```
