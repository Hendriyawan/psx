#! /system/bin/sh
# monitoring process with 'ps' command
# 29/03/2017
# by mr silent
function set_window_title() {
    title="$*"
    echo -ne "\033]0;$title \007"
}
function see_proc() {
    name=$*
    see_proc=$(ps | grep $name | awk '{print "\e[33m|===================================\e[0m\n" "\e[33m|\e[1;34m[*]\e[0m" " USER :"$1 "\n\e[33m|\e\e[1;34m[*]\e[0m" " PID :"$2 "\n\e[33m|\e[1;34m[*]\e[0m" " PPID :" $3" \n\e[33m|\e[1;34m[*]\e[0m" " VSIZE :"$4 "\n\e[33m|\e[1;34m[*]\e[0m" " RSS :"$5 "\n\e[33m|\e[1;34m[*]\e[0m" " WCHAN :"$6 "\n\e[33m|\e[1;34m[*]\e[0m" " PC :"$7 "\n\e[33m|\e[1;34m[*]\e[0m" " NAME :"$9 "\n\e[33m|===================================\e[0m";}')
    echo "$see_proc"
}
see_proc=$(ps | awk '{print "\e[33m|===================================\e[0m\n" "\e[33m|\e[1;34m[*]\e[0m" " USER :"$1 "\n\e[33m|\e[1;34m[*]\e[0m" " PID :"$2 "\n\e[33m|\e[1;34m[*]\e[0m" " PPID :"$3 "\n\e[33m|\e[1;34m[*]\e[0m" " VSIZE :"$4 "\n\e[33m|\e[1;34m[*]\e[0m" " RSS :"$5 "\n\e[33m|\e[1;34m[*]\e[0m" " WCHAN :"$6 "\n\e[33m|\e[1;34m[*]\e[0m" " PC :"$7 "\n\e[33m|\e[1;34m[*]\e[0m" " NAME :"$9 "\n\e[33m|===================================\e[0m";}')

arg=$*
if [ -z $arg ]; then
    if [ "`busybox id -u`" != "0" ]; then
        set_window_title "*)Monitoring process~"
        else
        set_window_title "root)Monitoring process~"
    fi
    echo "$see_proc"
    else
    if [ "`busybox id -u`" != "0" ]; then
        set_window_title "*)Monitoring process~"
        else
        set_window_title "root)Monitoring process~"
    fi
    see_proc $arg
fi
        