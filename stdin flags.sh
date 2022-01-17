COMMAND_LINE() {

  __showHelp() {
# `cat << EOF` This means that cat should stop reading when EOF is detected
cat << EOF
WGET

Description:
  Download a static web site recursively, including images and javascript. Do not compatible with SPAs (Single Page Applications)

Usage:

WGET
WGET  <website url> ... [-h]
WGET  <website url> <website url> ...

-h, -help,          --help                  Display help

-v, -version,       --version               Set and Download specific version of EspoCRM

-r, -rebuild,       --rebuild               Rebuild php vendor directory using composer and compiled css using grunt

-V, -verbose,       --verbose               Run script in verbose mode. Will print out each step of execution.

EOF
# EOF is found above and hence cat command stops reading. This is equivalent to echo but much neater when printing out.
}
  local options=$(getopt --longoptions "name:,version,verbose,help" --options "n:v:V:h:" -- "$@");
  # getopt -l "name:,version:,verbose:,help:" -options "n:v:V:h:" -- "$@"
  eval set -- "$options"

  while true; do
    case $1 in
    -h|--help)
        echo "Helping $@ ($1) ($2) ($3)" && __showHelp
        ;;
    -v|--version)
        echo "versioning $@"
        ;;
    -V|--verbose)
        echo "verbosing $@"
        ;;
    -n|--name)
        echo "naming $@"
        ;;
    --)
        shift
        break;;
    esac
    shift
  done
}
