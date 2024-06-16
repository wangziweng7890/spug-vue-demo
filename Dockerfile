  # 设置node版本
  from node:16

  # 设置工作目录
  WORKDIR /app

  # 先复制 package.json 和 package-lock.json 到工作目录，
  # 此操作可以利用docker镜像缓存，当依赖没有变化时，npm i 直接使用缓存
  COPY package*.json ./

  # 安装依赖
  RUN npm install

  # 在复制其余文件到工作目录
  COPY . .

  # 执行打包
  RUN npm run build

  # 清除镜像中node_modules目录，减小镜像体积
  RUN rm -rf node_modules

  