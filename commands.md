# Commands and usage

`cat -s $file | tee "$HOME/"$file` Produce some errors because concurrent transformation

---

##### Generate ssh key
```bash
ssh-keygen -t ed25519 -C 'jcrtexidor@gmail.com'
ssh-add ~/.ssh/id_ed25519
```
---
##### Associative Array
```bash
declare -A assArray2=( [HDD]=Samsung [Monitor]=Dell [Keyboard]=A4Tech )

declare -A continent

continent[Vietnam]=Asia
continent[France]=Europe
continent[Argentina]=America

for item in "${!continent[@]}"; do
  printf "$item is in ${continent[$item]} \n"
done
```
```bash
declare -a array=("one" "two" "three")

array=(
  "one"
  "two"
  "three"
)

List=('a' 'b' 'c')

echo $List      # a         :: Print just the first element
echo ${List[*]} # a b c     :: Print all elements
echo ${List[@]} # a b c     :: Print all elements
```
---
##### Iteration
```bash
for vowel in 'a b c'; do # Iter an string
  echo $vowel
done

for vowel in $array; do # Iter an array
  echo $vowel
done

for vowel in 'a' 'b' 'c'; do # Iter an group
  echo $vowel
done
```
############################################################################################################################################

path/without/space
"path/with\ one\ or\ two/spaces"
"path/with one or two/spaces"

############################################################################################################################################

source ./util.sh

if $(__checkSnap); then
  echo "Snap Sucess"
else
  echo "Snap Fail"
fi

############################################################################################################################################

uuidgen # Genera un uuid

############################################################################################################################################

while true; do for X in '-' '/' '|' '\'; do
  echo -en "\b$X"
  sleep 0.2
done; done

############################################################################################################################################
# Text Reset
Color_Off=$'\033[0m'

# Regular Colors	         # Bold	                      # Underline	                # High Intensity	          # Bold High Intensity
Black=$'\033[0;30m' BBlack=$'\033[1;30m' UBlack=$'\033[4;30m' IBlack=$'\033[0;90m' BIBlack=$'\033[1;90m'
Red=$'\033[0;31m' BRed=$'\033[1;31m' URed=$'\033[4;31m' IRed=$'\033[0;91m' BIRed=$'\033[1;91m'
Green=$'\033[0;32m' BGreen=$'\033[1;32m' UGreen=$'\033[4;32m' IGreen=$'\033[0;92m' BIGreen=$'\033[1;92m'
Yellow=$'\033[0;33m' BYellow=$'\033[1;33m' UYellow=$'\033[4;33m' IYellow=$'\033[0;93m' BIYellow=$'\033[1;93m'
Blue=$'\033[0;34m' BBlue=$'\033[1;34m' UBlue=$'\033[4;34m' IBlue=$'\033[0;94m' BIBlue=$'\033[1;94m'
Purple=$'\033[0;35m' BPurple=$'\033[1;35m' UPurple=$'\033[4;35m' IPurple=$'\033[0;95m' BIPurple=$'\033[1;95m'
Cyan=$'\033[0;36m' BCyan=$'\033[1;36m' UCyan=$'\033[4;36m' ICyan=$'\033[0;96m' BICyan=$'\033[1;96m'
White=$'\033[0;37m' BWhite=$'\033[1;37m' UWhite=$'\033[4;37m' IWhite=$'\033[0;97m' BIWhite=$'\033[1;97m'

# Background	             # High Intensity backgrounds
On_Black=$'\033[40m' On_IBlack=$'\033[0;100m'
On_Red=$'\033[41m' On_IRed=$'\033[0;101m'
On_Green=$'\033[42m' On_IGreen=$'\033[0;102m'
On_Yellow=$'\033[43m' On_IYellow=$'\033[0;103m'
On_Blue=$'\033[44m' On_IBlue=$'\033[0;104m'
On_Purple=$'\033[45m' On_IPurple=$'\033[0;105m'
On_Cyan=$'\033[46m' On_ICyan=$'\033[0;106m'
On_White=$'\033[47m' On_IWhite=$'\033[0;107m'

echo "$Blue I like chocolate cake "

############################################################################################################################################

# Standard POSIX
#
# [[:alnum:]]   Alphanumeric characters
# [[:alpha:]]   Alphabetic characters
# [[:blank:]]   Space and tab
# [[:cntrl:]]   Control characters
# [[:digit:]]   Digits
# [[:graph:]]   Visible characters (anything except spaces and control characters)
# [[:lower:]]   Lowercase letters
# [[:print:]]   Visible characters and spaces (anything except control characters)
# [[:punct:]]   Punctuation (and symbols).
# [[:space:]]   All whitespace characters, including line breaks
# [[:upper:]]   Uppercase letters
# [[:xdigit:]]  Hexadecimal digits
#
# None Standards
#
# [[:ascii:]]   ASCII characters
# [[:word:]]    Word characters (letters, numbers and underscores)
#
# legacy syntax (can someone find reference to these?)
#
# [[:<:]]       Start of Word
# [[:>:]]       End of Word

############################################################################################################################################
# Read from stdin in the same line as output
echo -n "OUTPUT"
read input && echo 'The input was '$input

read -p "OUTPUT " input && echo 'The input was '$input

read -i 'PREFIX' -e input && echo 'The input was '$input

############################################################################################################################################

test $EXPRESSION
[ $EXPRESSION ]

# ( EXPRESSION )                  EXPRESSION is true
# ! EXPRESSION                    EXPRESSION is false
# EXPRESSION1 -a EXPRESSION2      both EXPRESSION1 and EXPRESSION2 are true
# EXPRESSION1 -o EXPRESSION2      either EXPRESSION1 or EXPRESSION2 is true

# -n STRING               the length of STRING is nonzero
# STRING                  equivalent to -n STRING
# -z STRING               the length of STRING is zero
# STRING1 = STRING2       the strings are equal
# STRING1 != STRING2      the strings are not equal

# INTEGER1 -eq INTEGER2      INTEGER1 is equal to INTEGER2
# INTEGER1 -ge INTEGER2      INTEGER1 is greater than or equal to INTEGER2
# INTEGER1 -gt INTEGER2      INTEGER1 is greater than INTEGER2
# INTEGER1 -le INTEGER2      INTEGER1 is less than or equal to INTEGER2
# INTEGER1 -lt INTEGER2      INTEGER1 is less than INTEGER2
# INTEGER1 -ne INTEGER2      INTEGER1 is not equal to INTEGER2

# FILE1 -ef FILE2      FILE1 and FILE2 have the same device and inode numbers
# FILE1 -nt FILE2      FILE1 is newer (modification date) than FILE2
# FILE1 -ot FILE2      FILE1 is older than FILE2

# -b FILE       FILE exists and is block special
# -c FILE       FILE exists and is character special
# -d FILE       FILE exists and is a directory
# -e FILE       FILE exists
# -f FILE       FILE exists and is a regular file
# -g FILE       FILE exists and is set-group-ID
# -G FILE       FILE exists and is owned by the effective group ID
# -h FILE       FILE exists and is a symbolic link (same as -L)
# -k FILE       FILE exists and has its sticky bit set
# -L FILE       FILE exists and is a symbolic link (same as -h)
# -N FILE       FILE exists and has been modified since it was last read
# -O FILE       FILE exists and is owned by the effective user ID
# -p FILE       FILE exists and is a named pipe
# -r FILE       FILE exists and read permission is granted
# -s FILE       FILE exists and has a size greater than zero
# -S FILE       FILE exists and is a socket
# -t FD         file descriptor FD is opened on a terminal
# -u FILE       FILE exists and its set-user-ID bit is set
# -w FILE       FILE exists and write permission is granted
# -x FILE       FILE exists and execute (or search) permission is granted

# EXAMPLE
test 1 != 2 && echo 'true' || echo 'false' # Return 'true'

############################################################################################################################################

SCRIPT_PATH="/path/to/script.sh"

"$SCRIPT_PATH" # Execute a bash script from another.

. "$SCRIPT_PATH"

source "$SCRIPT_PATH" # «source» is an alias for «.»

bash "$SCRIPT_PATH"

eval '"$SCRIPT_PATH"'

OUTPUT=$("$SCRIPT_PATH")
echo $OUTPUT

OUTPUT=$("$SCRIPT_PATH")
echo $OUTPUT

("$SCRIPT_PATH")

(exec "$SCRIPT_PATH")

############################################################################################################################################
APPLICATON=node

which $APPLICATION # Print the full path

############################################################################################################################################

PID=1234 # Process ID
PROCESS_NAME='firefox'

kill $PID
pkill $PROCESS_NAME
killall $PROCESS_NAME
xkill

############################################################################################################################################

APPLICATION=node

if command -v $APPLICATION &>/dev/null; then
  echo 'It is installed'
else
  echo 'It is not installed' && exit 1
fi

############################################################################################################################################

USER='jc'                        # Remote user
IP='10.36.32.218'                # Remote ip
SOURCE='/home/jc/Downloads/'     # Remote ip
DESINATION='/home/jc/Downloads/' # Remote ip

ssh $USER@$IP
scp -r $USER@$IP:$SOURCE $DESINATION   # Only can copy files
rsync -a $USER@$IP:$SOURCE $DESINATION # Can copy files and directories

############################################################################################################################################
cd /home/jc/Games/Dont-Starve-Together-SteamRIP.com/Dont\ Starve\ Together\ v490602/bin/
APPLICATION='dontstarve_steam.exe'
setarch i386 wine $APPLICATION -opengl

# Mods
# combined_status, automatic_health_adjust, simple_health_bar_dst, achievements_and_level_system

############################################################################################################################################

# Read from stdin one line at time and do some action with each line

for s in $(ls -BhN1); do echo $s; done
ls -BhN1 | while read line; do ls -l "$line"; done

############################################################################################################################################
DIRECTORY=/home/jc/Books
getfattr --absolute-names --dump --recursive --encoding=text $DIRECTORY | sed -r '/^#.*$/d' | sed '/^$/d'

############################################################################################################################################
DIRECTORY=/home/jc/Videos
find $DIRECTORY -type f -iname '*.mp4' -exec ffmpeg -i {} {}.mp3 \;
find $DIRECTORY -type f -iname '*.mp4' -exec ffmpeg -i {} -target pal-vcd {}.mpg \;

############################################################################################################################################
PDF=/home/jc/Books/input.pdf
METADATA=/home/jc/Books/metadata.txt

pdftk $PDF dump_data_utf8                  # Print to stdout
pdftk $PDF dump_data_utf8 output $METADATA # Print to a file

BROKEN=/home/jc/Books/broken.pdf
FIXED=/home/jc/Books/fixed.pdf

pdftk $BROKEN output $FIXED
# pdftk can increase or decrease the size of the output file, in some cases more than 3 times the original file.

############################################################################################################################################

PDF=/home/jc/Books/input.pdf

exiftool -Title= $PDF            # Remove the title in the metadata of $PDF
exiftool -Title="New Title" $PDF # Modify the title in the metadata of $PDF
exiftool -a $PDF                 # Return all metadata in $PDF
exiftool -all $PDF
exiftool -all= $PDF              # Limpia todos los metadatos del archivo.

exiftool -struct -g -json $PDF   # Return a json structured by groups of $PDF metadata.
exiftool -listg0                 # List the first family of groups
exiftool -listw -PDF:ALL         # List all writtable tags for PDF group.


exiftool -listf # List all supported file extensions


############################################################################################################################################
PDF=/home/jc/Books/input.pdf

pdfinfo $PDF

############################################################################################################################################


############################################################################################################################################



############################################################################################################################################

sudo smbpasswd -a $USER # Add the login user to samba
systemctl reload smb    # Reaload samba service

smbpasswd -r uci.cu -U jctexidor # Change the password in UCI domain

############################################################################################################################################

tar -xf FILE

# -f, --file=ARCHIVE		    use archive file or device ARCHIVE
# -x, --extract, --get      extract files from an archive
