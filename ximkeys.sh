if [[ -z $* ]]; then
        echo "Usage: ${0##*/} 'character(s)'" >&2
            echo "Multiple characters are supported." >&2
                echo "They don't need to be space-separated." >&2
                    exit 1
fi

# determine the current language setting.  If not UTF-8, exit with error
re='(.*)[.][Uu][Tt][Ff].*8'
if [[ $LANG =~ $re ]]; then

        lang="${BASH_REMATCH[1]}"
            codeset=UTF-8

        else

                echo "Sorry, only UTF-8 is supported at present" >&2
                    exit 1

fi

# test for existence of the proper dir and file
dir=/usr/share/X11/locale

if [[ ! -d "$dir" ]]; then #if not found, check for the older X11 dir

        dir=/usr/X11R6/lib/X11/locale

fi

if [[ ! -d "$dir" || ! -r "$dir/locale.dir" ]]; then

        echo "Sorry, couldn't find your X windows locale data" >&2
            exit 1

fi

# extract the correct codepage file from the locale.dir
page="$( grep -m1 "${lang}.${codeset}$" <$dir/locale.dir )"
page=${page%%/*}
file="$dir/$page/Compose"

# loop through input characters, and print all matching entries.
echo

while read -n 1 character; do

        [[ -z $character ]] && continue
            echo "combinations found for [$character]"
                grep -F "\"$character\"" "$file"
                    echo

                done <<<"$*"

                exit 0
