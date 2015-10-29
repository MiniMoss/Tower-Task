class Event < ActiveRecord::Base
  has_and_belongs_to_many :projects

  # 因为未做登录机制，所以假定当前登录的用户名为Yun
  @current_user = "Yun"

  # 对于新建，删除，完成任务时，把当前用户写入event_creator字段
  def self.set_creator
    event = Event.new
    event.event_creator = @current_user

    return event
  end

  def self.set_event_topic(to_do)
    event = Event.new
    event.event_topic = to_do.topic

    return event
  end

  def self.set_event_create_time(to_do)
    event = Event.new
    event.event_time = to_do.created_at

    return event
  end

  def self.set_event_update_time(event, to_do)
    event.event_time = to_do.updated_at

    return event
  end

  def self.set_event_type(type)
    event = Event.new
    event.event_type = type

    return event
  end

end
