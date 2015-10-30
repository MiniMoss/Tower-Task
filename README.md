<H1>Event Demo配置运行说明</H1>

* Ruby版本 ruby 2.1.1， Rails版本 rails 4.2.3

* 数据库使用MySQL，建立名为TowerTask_development的数据库，具体数据库配置见database.yml

* 初始化程序  
  bundle install  
  建立development环境数据表  
  rake db:migrate RAILS_ENV=development  
  初始化development环境events表数据  
  rake db:seeds RAILS_ENV=development  

* 运行程序  
  rails server  
  路由表已经把event_controller#index页面配置为root，地址为http://localhost:3000  

* 运行测试环境  
  建立test环境数据表  
  rake db:migrate RAILS_ENV=text  
  初始化rspec   
  rails generate rspec:install  
  建立event model测试  
  rails generate rspec:model event  
  运行测试  
  bundle exec rspec               
  
  
