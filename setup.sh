#!/bin/bash

# Cài đặt các thư viện cần thiết
npm install axios fs path https-proxy-agent async readline

# Định nghĩa các biến và hàm
queryPath="$(dirname "$0")/query.txt"
proxyFilePath="$(dirname "$0")/proxy.txt"
timeCountDown=120

checkProxyIP() {
    proxy="$1"
    response=$(curl -x "$proxy" -s https://api.ipify.org?format=json)
    ip=$(echo "$response" | jq -r '.ip')
    echo -e "\nĐịa chỉ IP của proxy là: $ip"
}

processQuery() {
    query_id=$(echo "$1" | tr -d '\r\n')
    user_id=$(echo "$query_id" | grep -oP 'user=%7B%22id%22%3A(\d+)')
    
    # Thêm xử lý cho phần còn lại của hàm này tại đây
    # ...

    sleep 1
}

# Thêm các hàm và biến cần thiết khác tại đây

# Hỏi người dùng về việc làm task
askTodoTask() {
    read -p "Có làm task không? (y/n): " answer
    if [ "$answer" == "y" ]; then
        return 0
    else
        return 1
    fi
}

# Thực thi chương trình
run() {
    isTodoTask=$(askTodoTask)
    
    while true; do
        for query in $(cat "$queryPath"); do
            index=0
            for proxy in $(cat "$proxyFilePath"); do
                processQuery "$query" "$proxy" "$isTodoTask"
                ((index++))
            done
        done

        for (( i = $timeCountDown * 60; i > 0; i-- )); do
            echo -ne "\rBắt đầu vòng lặp sau $i giây..."
            sleep 1
        done
    done
}

run
