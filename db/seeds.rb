# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 事件类型，用于新建记录随机取出
event_type_pool = ['event_new', 'event_deleted', 'event_completed', 'event_assignment', 'event_change_assignment', 'event_modify_end_time', 'event_comment']

# 事件创建者，用于新建记录随机取出
event_creator_pool = ['user1', 'user2', 'user3', 'user4']

# 创建一周内的随机日期时间
def random_datetime
  end_time = Time.now
  start_time = (end_time - 1.week).to_i
  random_datetime = Time.at(rand(end_time.to_i - start_time)) + start_time

  return random_datetime
end

# 创建随机字符串，代表event_topic
def random_topic
  random_topic = (0...8).map { (65 + rand(26)).chr }.join

  return random_topic
end

for i in 1..100
  Event.create!({event_type: event_type_pool.sample, event_time: random_datetime(), event_creator: event_creator_pool.sample, event_topic: random_topic()})
end
