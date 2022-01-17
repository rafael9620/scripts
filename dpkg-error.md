# Fix "Sub-process /usr/bin/dpkg returned an error code (1)" In Ubuntu

If you encountered with an error like above, worry not! Here, I have given a few workarounds to solve "Sub-process /usr/bin/dpkg returned an error code (1)" issue in Ubuntu and its variants such as Linux Mint, Pop OS.
## Solution 1 - Reconfigure dpkg database

If the package installation process is stopped or interrupted in mid-way, the dpkg database might be corrupted. Reconfiguring dpkg database may solve this issue.

To reconfigure dpkg database, simply run:

```bash
$ sudo dpkg --configure -a
```

This command will try to fix the corrupted dpkg database and then reconfigure all broken packages. This command usually fixes the dpkg returned an error code (1) problem. If it didn't solve the issue for any reason, follow the subsequent solutions.

## Solution 2 - Force install the application

If the first method didn't work, run the following command to perform force install:

```bash
$ sudo apt-get install -f
````

Or,

```bash
$ sudo apt-get install --fix-broken
```

Here, -f (or --fix-broken) option will attempt to correct the Ubuntu system with broken dependencies.

If these two solutions didn't help and the issue still persists, try the next solution.

## Solution 3 - Remove the problematic application .deb file from the local cache folder and reinstall it

As you see in the error message (the last two lines), the eog package is causing this error.

[...]
/var/cache/apt/archives/eog_3.36.2-0ubuntu1_amd64.deb 
E: Sub-process /usr/bin/dpkg returned an error code (1)

For those wondering, eog (short for Eye of GNOME) is the official and default image viewer for the GNOME desktop environment. So this package is problematic and doesn't let me to upgrade my Ubuntu.

When you install a package, it will be downloaded and saved in the cache folder /var/cache/apt/archives/.

To fix this error, remove the cached package using command:

```bash
$ sudo rm /var/cache/apt/archives/eog_3.36.2-0ubuntu1_amd64.deb
```

Replace eog_3.36.2-0ubuntu1_amd64.deb with your package.

Clean the package cache folder:

```bash
$ sudo apt-get clean
$ sudo apt-get autoremove
```

Update the source lists:

```bash
$ sudo apt-get update
```
Upgrade your system:

```bash
$ sudo apt-get upgrade
```
Finally, get the fresh package from official repositories and reinstall it like below:

```bash
$ sudo apt-get install eog
```

This solution worked for me.
## Solution 4 - Remove the problematic application

This should be your last resort. If none of the above methods help, remove the problematic package from your system like below:

```bash
$ sudo apt-get remove --purge eog
$ sudo apt-get clean && sudo apt-get autoremove
```

This command will remove eog with all its configuration files from the system.

And also find and remove all files associated with the broken package.

To find all files related to a package, run:

``` bash
$ sudo ls -l /var/lib/dpkg/info | grep -i eog
```

Sample output:

-rw-r--r-- 1 root root 61926 Apr 24 13:42 eog.list
-rw-r--r-- 1 root root 5889 Mar 29 08:01 eog.md5sums

Remove them manually.

That's it. At this stage, any one of the these four solutions should have helped you to fix "Sub-process /usr/bin/dpkg returned an error code (1)" in Ubuntu and other DEB-based systems.
