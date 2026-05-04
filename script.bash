#!/bin/bash

# 1. Đường dẫn đến file lưu giá trị i (nằm cùng thư mục với script)
COUNTER_FILE="counter.txt"

# 2. Kiểm tra nếu file chưa tồn tại thì tạo file với giá trị khởi đầu là 7
if [ ! -f "$COUNTER_FILE" ]; then
    echo 0 > "$COUNTER_FILE"
fi

# 3. Đọc giá trị i hiện tại từ file
i=$(cat "$COUNTER_FILE")

# 4. Thực hiện các lệnh của bạn
cp /Users/huynhnhatlinh0305/Downloads/devsecops-factory/ci/Jenkinsfile ./
rm -rf kubernetes
cp -r /Users/huynhnhatlinh0305/Downloads/devsecops-factory/kubernetes ./
git add .
git commit -m "Commit version $i"

git pull --rebase origin main
git push -u origin main

# 5. Tăng giá trị i lên 1 và ghi đè lại vào file counter.txt
i=$((i + 1))
echo $i > "$COUNTER_FILE"
