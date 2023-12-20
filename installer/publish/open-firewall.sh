#! /bin/bash

script=${1:-"status"}
directional=${2}
firewall_type="firewalld"

openports=("28000/tcp")

firewall_open() {
    if [ ${firewall_type} == "ufw" ]; then
        tmp=${1/-/:}
        if [ ! -z $2 ]; then
            ufw allow proto ${tmp##*/} from $2 to any port ${tmp%/*}
        else
            ufw allow $tmp
        fi
    else
        if [ ! -z $2 ]; then
            firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="$2" port protocol="${1##*/}" port="${1%/*}" accept"
        else
            firewall-cmd --zone=public --add-port=$1 --permanent
        fi
    fi
}

firewall_close() {
    if [ ${firewall_type} == "ufw" ]; then
        tmp=${1/-/:}
        if [ ! -z $2 ]; then
            ufw delete allow proto ${tmp##*/} from $2 to any port ${tmp%/*}
        else
            ufw delete allow $tmp
        fi
    else
        if [ ! -z $2 ]; then
            firewall-cmd --permanent --remove-rich-rule="rule family="ipv4" source address="$2" port protocol="${1##*/}" port="${1%/*}" accept"
        else
            firewall-cmd --zone=public --remove-port=$1 --permanent
        fi
    fi
}

firewall_status() {
    if [ ${firewall_type} == "ufw" ]; then
        ufw status
    else
        firewall-cmd --list-rich-rules
        firewall-cmd --list-ports
    fi
}

firewall_reload() {
    if [ ${firewall_type} == "ufw" ]; then
        ufw reload
    else
        firewall-cmd --reload
    fi
}

open_firewall_ip() {
    directionalArr=($(echo ${directional} | tr ',' ' '))
    for port in ${openports[@]}; do
        for d in ${directionalArr[@]}; do
            echo "Open firewall -> [${d}:${port}]"
            firewall_open $port ${d}
        done
    done

    # if [ ${firewall_type} != "ufw" ]; then
    #     firewall-cmd --zone=public --add-masquerade --permanent
    # fi

    firewall_reload
}

close_firewall_ip() {
    directionalArr=($(echo ${directional} | tr ',' ' '))
    for port in ${openports[@]}; do
        for d in ${directionalArr[@]}; do
            echo "Close firewall -> [${d}:${port}]"
            firewall_close $port ${d}
        done
    done

    # if [ ${firewall_type} != "ufw" ]; then
    #     firewall-cmd --zone=public --remove-masquerade --permanent
    # fi

    firewall_reload
}

open_firewall() {
    for port in ${openports[@]}; do
        echo "Open firewall -> [0.0.0.0:${port}]"
        firewall_open $port
    done

    # if [ ${firewall_type} != "ufw" ]; then
    #     firewall-cmd --zone=public --add-masquerade --permanent
    # fi

    firewall_reload
}

close_firewall() {
    for port in ${openports[@]}; do
        echo "Close firewall -> [0.0.0.0:${port}]"
        firewall_close $port
    done

    # if [ ${firewall_type} != "ufw" ]; then
    #     firewall-cmd --zone=public --remove-masquerade --permanent
    # fi

    firewall_reload
}

main() {
    if [[ $(which ufw) && $(ufw version) ]]; then
        firewall_type='ufw'
    fi

    if [ ${script} == "close" ]; then
        if [ ! -z ${directional} ]; then
            close_firewall_ip
        else
            close_firewall
        fi
    elif [ ${script} == "open" ]; then
        if [ ! -z ${directional} ]; then
            open_firewall_ip
        else
            open_firewall
        fi
    elif [ ${script} == "status" ]; then
        firewall_status
    else
        echo 'Instruction does not exist'
    fi
}

main
