#!/bin/bash

# Lấy nội dung của logo và hiển thị
curl -s https://raw.githubusercontent.com/Huyme99/logo/refs/heads/main/logo.sh | bash
sleep 3

show() {
    echo -e "\033[1;34m$1\033[0m"
}

show "Updating package list and installing Git..."
echo
sudo apt update
sudo apt install -y git
echo

show "Installing Node.js..."
# Thực thi mã để cài đặt Node.js
wget -O - https://raw.githubusercontent.com/Huyme99/Installation/refs/heads/main/node.sh | bash
echo

# Tạo hai tập tin proxy.txt và query.txt
echo "http://username:password@ip:port" > proxy.txt
echo "query_id= hoặc user=" > query.txt


# Hàm chỉnh sửa tập tin proxy.txt
edit_proxy() {
    nano proxy.txt  # Mở tập tin proxy.txt bằng trình soạn thảo nano
}

# Hàm chỉnh sửa tập tin query.txt
edit_query() {
    nano query.txt  # Mở tập tin query.txt bằng trình soạn thảo nano
}

chooseOption() {
    show "Chỉnh sửa proxy.txt..."
    edit_proxy  # Gọi hàm chỉnh sửa proxy.txt

    show "Chỉnh sửa query.txt..."
    edit_query  # Gọi hàm chỉnh sửa query.txt

    echo "Bạn đã thêm thành công proxy và query"
}

# Thực thi chương trình
run() {
    chooseOption
}

run
