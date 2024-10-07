#!/bin/bash

clear  # Xóa màn hình terminal

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
wget -O - https://raw.githubusercontent.com/Huyme99/Installation/refs/heads/main/node.sh | bash
echo

# Điều chỉnh để thực thi chương trình sau khi clear và thực hiện các lệnh trên
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



