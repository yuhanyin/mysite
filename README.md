# README

## local dev

```sh
# 拉取github上的仓库
git clone https://github.com/yuhanyin/mysite.git

# 开发环境安装依赖
bundle install --without production

# 执行数据库初始化工作 
rails db:migrate:reset
# or 
bundle exec rake db:migrate

#线上环境drop数据库需要以下命令
RAILS_ENV=production rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1  

# 清空数据, 一般因为权限问题会执行失败, 如过失败, 可以手动删除db目录下的development.sqlit3
bundle exec rake db:migrate:reset
# 执行seeds.rb, 创建测试数据, 导入了lib文件夹里的csv数据
bundle exec rake db:seed

# 执行测试
rails test

# 本地开启服务进行开发
rails server

# 本地模拟线上调试, 手动添加环境变量
rake db:migrate RAILS_ENV=production
rake db:seed RAILS_ENV=production
rails server -e production
```

测试帐号更改在 db/seed.rb里, 分别创建了admin帐号和20个user账号, 
在代码第10行, 导入了lib文件夹里的csv数据9000+条, 也可以把csv的名字改成test, 里面有20条测试数据, 因为本地开发数据量导入非常耗时

## depoly

