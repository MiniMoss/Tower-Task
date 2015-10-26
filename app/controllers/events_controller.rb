class EventsController < ApplicationController
  def index
    # 获取所有event，并根据日期分组
    events_group_by_date = Event.all.group_by{ |u| u.event_time.to_date }
    # 根据日期，按照倒序排列event
    @events_arr = events_group_by_date.sort_by { |k,v| k }.reverse
  end

end
