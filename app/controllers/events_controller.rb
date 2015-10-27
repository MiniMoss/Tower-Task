class EventsController < ApplicationController
  def index
    # 获取所有event，并根据日期分组
    events_group_by_date = Event.all.group_by{ |u| u.event_time.to_date }
    # 根据日期，按照倒序排列event
    @events_arr_sorted = events_group_by_date.sort_by { |k,v| k }.reverse
    # 按时间倒序获取所有events组成array
    events = Array.new
    @events_arr_sorted.map do |e_one_day|
      e_one_day[1].sort_by(&:event_time).reverse.map do |e|
        events << e
      end
    end
    @pagenate_arr = Kaminari.paginate_array(events).page(params[:page]).per(50)
    # 利用kaminari分页加载数据，每页加载50条，根据分页分组数据
    num_of_pages = @pagenate_arr.num_pages
    events_arr_per_page = Array.new()
    events_sort_by_date_per_page = Array.new()
    @events_arr = Array.new
    for i in 1..num_of_pages
      j = i - 1
      if i < num_of_pages
        events_arr_per_page[j] = events[j*50, 50]
      else
        # 边界处理
        events_arr_per_page[j] = events[j*50, @pagenate_arr.page(num_of_pages).size]
      end
      events_sort_by_date_per_page[j] = events_arr_per_page[j].group_by{ |u| u.event_time.to_date }
      @events_arr[j]  = events_sort_by_date_per_page[j].sort_by { |k,v| k }.reverse
    end
  end

end
