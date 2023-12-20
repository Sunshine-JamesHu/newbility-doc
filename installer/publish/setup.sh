#! /bin/bash

app='firefly'
target="/usr/lib/systemd/system/$app.service"
scripts='install/uninstall/start/restart/stop/status'

usage="$(basename "$0") [-h|-help] [-s|-script <$scripts>]
This program will run.
Arguments:
    -h|--help  show this help 
    -s|--script  script ex: $scripts"

ARGS=$(getopt -a -o hs: -l help,script: -- "$@")

#重新排列参数顺序
eval set -- "${ARGS}"
#通过shift和while循环处理参数
while true; do
    case $1 in
    -s | --script)
        script=$2
        shift
        ;;
    -h | --help)
        echo "$usage"
        exit
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Internal error!"
        exit 1
        ;;
    esac
    shift
done

set -e

if [ -z $script ]; then
    echo "$usage"
    exit
fi

install() {
    if [ -f "$target" ]; then
        echo "[$app]Already installed, cannot be reinstalled"
        exit
    fi
    echo "$(sed "s#\${APP_PATH}#$(pwd)#" ./$app.service)" >$target

    chmod +x ./app/firefly-auto-deployer

    systemctl enable $app
    systemctl start $app

    echo "==== success ===="
}

uninstall() {
    running=$(systemctl status $app | grep 'Active' | grep 'running' | wc -l)
    if [ $running = 1 ]; then
        systemctl stop $app
    fi

    if [ -f "$target" ]; then
        rm -rf $target
    fi

    echo "==== success ===="
}

main() {
    if [ $script == 'start' ]; then
        systemctl start $app
    elif [ $script == "stop" ]; then
        systemctl stop $app
    elif [ $script == "restart" ]; then
        systemctl restart $app
    elif [ $script == "status" ]; then
        systemctl status $app
    elif [ $script == "install" ]; then
        install
    elif [ $script == "uninstall" ]; then
        uninstall
    else
        echo 'Instruction does not exist'
    fi
}

if [ ! -z $script ]; then
    main $script
else
    echo "$usage"
fi
exit
