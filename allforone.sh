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

# Hàm để chọn lựa chọn 1 hoặc 2
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

# Hàm để chọn và chỉnh sửa proxy và query
chooseAndEditOptions() {
    show "Chỉnh sửa proxy.txt..."
    edit_proxy  # Gọi hàm chỉnh sửa proxy.txt

    show "Chỉnh sửa query.txt..."
    edit_query  # Gọi hàm chỉnh sửa query.txt

    echo "Bạn đã thêm thành công proxy và query"
}

# Thực hiện chọn và chỉnh sửa proxy và query
chooseAndEditOptions

# Thực thi chương trình
run() {
    chooseOption
}

run
