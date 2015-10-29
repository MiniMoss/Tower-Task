require 'rails_helper'

RSpec.describe Event, type: :model do
  # 测试新建任务
  it "sets current user as event creator" do
    event = Event.set_creator
    expect(event.event_creator).to eq "Yun"
  end

  it "sets event topic via to_do" do
    @to_do = Todo.create(topic: "something to do")
    event = Event.set_event_topic(@to_do)
    expect(event.event_topic).to eq "something to do"
  end

  it "sets event create time via to_do" do
    @to_do = Todo.create(topic: "something to do")
    event = Event.set_event_create_time(@to_do)
    expect(event.event_time).to eq @to_do.created_at
  end

  it "sets event update time via to_do" do
    @to_do = Todo.create(topic: "something to do")
    @to_do.update(topic: "something not to do")
    @event = Event.create(event_time: Time.now)
    Event.set_event_update_time(@event, @to_do)
    expect(@event.event_time).to eq @to_do.updated_at
  end

  it "sets event type" do
    # 以新建todo为例
    event = Event.set_event_type("event_new")
    expect(event.event_type).to eq "event_new"
  end

end
