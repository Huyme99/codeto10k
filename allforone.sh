#!/bin/bash

echo
# Lấy nội dung của logo và hiển thị
logo_content=$(curl -s https://raw.githubusercontent.com/Huyme99/logo/refs/heads/main/logo.sh)
echo -e "$logo_content"

show() {
    echo -e "\033[1;34m$1\033[0m"
}

show "Updating package list and installing Git..."
echo
sudo apt update
sudo apt install -y git
echo

# Lưu vị trí hiện tại của con trỏ in
tput sc

show "Installing Node.js..."
# Thực thi mã để cài đặt Node.js
wget -O - https://raw.githubusercontent.com/Huyme99/Installation/refs/heads/main/node.sh | bash
echo

# Di chuyển con trỏ in về đúng vị trí của logo sau khi clear màn hình
tput rc

# Xóa màn hình terminal
clear

# Định nghĩa hàm cho lựa chọn số 1 và số 2
chooseOption() {
    read -p "Chọn 1 để chạy file setup.sh hoặc chọn 2 để hủy bỏ (1/2): " choice
    case $choice in
        1)
            echo "Đang chạy file setup.sh từ link..."
            curl -s https://raw.githubusercontent.com/Huyme99/codeto10k/refs/heads/main/setup.sh | bash
            ;;
        2)
            echo "Hủy bỏ."
            ;;
        *)
            echo "Lựa chọn không hợp lệ."
            ;;
    esac
}

# Thực thi chương trình
run() {
    chooseOption
}

run
