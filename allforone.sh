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
echo "Nội dung cho proxy.txt" > proxy.txt
echo "Nội dung cho query.txt" > query.txt


# Hàm chỉnh sửa tập tin proxy.txt
edit_proxy() {
    nano proxy.txt  # Mở tập tin proxy.txt bằng trình soạn thảo nano
}

# Hàm chỉnh sửa tập tin query.txt
edit_query() {
    nano query.txt  # Mở tập tin query.txt bằng trình soạn thảo nano
}

clear  # Xóa màn hình terminal

# Hàm để chọn lựa chọn 1 hoặc 2
chooseOption() {
    read -p "Chọn 1 để chỉnh sửa proxy.txt hoặc chọn 2 để chỉnh sửa query.txt (1/2): " choice
    case $choice in
        1)
            show "Chỉnh sửa proxy.txt..."
            edit_proxy  # Gọi hàm chỉnh sửa proxy.txt
            ;;
        2)
            show "Chỉnh sửa query.txt..."
            edit_query  # Gọi hàm chỉnh sửa query.txt
            ;;
        *)
            show "Lựa chọn không hợp lệ."
            ;;
    esac
}

# Thực thi chương trình
run() {
    chooseOption
}

run
