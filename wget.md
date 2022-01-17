# wget


```bash
WGET() {

  echo -e "\n***Do not use on Single Page Applications(SPA)***\n";

  __get() {
    local domain=$(echo $1 | sed -nE 's!(http|https)://!!p' | sed -nE 's!/.*!!p')
    echo 'Website:  '$domain'\n'
    wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --no-clobber --domains $domain $1
  }

  local url;

  if [ -z $1 ]; then
    read -p "URL: " url
    __get $url
  else
    for url in "$@"; do
      __get $url
    done
  fi

}
```
#### Params
```bash
# --mirror                        Makes (among other things) the download recursive.
# --convert-links                 Convert all the links (also to stuff like CSS stylesheets) to relative, so it will be suitable for offline viewing.
# --adjust-extension              Adds suitable extensions to filenames (html or css) depending on their content-type.
# --page-requisites               Download things like CSS style-sheets and images required to properly display the page offline.
# --no-parent                     When recursing do not ascend to the parent directory. It useful for restricting the download to only a portion of the site.
# --recursive                     Download the entire Web site.
# --domains website.org           Don't follow links outside website.org.
# --html-extension                Save files with the .html extension.
# --restrict-file-names=windows   Modify filenames so that they will work in Windows as well.
# --no-clobber                    Don't overwrite any existing files (used in case the download is interrupted and resumed).
```

#### EXAMPLE
```bash
domain='www.markdownguide.org'
website='https://www.markdownguide.org/'

wget --recursive                                              \
     --adjust-extension                                       \
     --mirror                                                 \
     --no-parent                                              \
     --no-clobber                                             \
     --page-requisites                                        \
     --html-extension                                         \
     --convert-links                                          \
     --restrict-file-names=windows                            \
     --domains $domain                                        \
     $website

```
