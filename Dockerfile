# Sử dụng một image Node.js làm cơ sở
FROM node:18-alpine

# Tạo thư mục làm việc
WORKDIR /app

# Cài đặt Yarn
RUN npm install -g yarn

# Copy package*.json và package-lock.json vào container
COPY package*.json ./

# Cài đặt các dependency
RUN yarn install


# Copy toàn bộ source code vào container
COPY . .

# Xây dựng ứng dụng
RUN yarn build

# Định nghĩa cổng để truy cập ứng dụng
EXPOSE 5173

# Command để chạy ứng dụng
CMD ["yarn", "dev"]