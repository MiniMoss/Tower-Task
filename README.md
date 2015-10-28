<H1>Event Demo配置运行说明</H1>

* Ruby版本 ruby 2.1.1， Rails版本 rails 4.2.3

* 数据库使用MySQL，建立名为TowerTask_development的数据库，具体数据库配置见database.yml

* 初始化程序  
  rake db:migrate    建立数据表  
  rake db:seeds      初始化events表数据
* 运行程序  
  rails server  
  路由表已经把event_controller#index页面配置为root，地址为http://localhost:3000
* How to run the test suite

