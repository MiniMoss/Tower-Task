module EventsHelper
  def event_type_description(event_type)
    case event_type
    when "event_new"
      "创建了任务："
    when "event_deleted"
      "删除了任务："
    when "event_completed"
      "完成了任务："
    when "event_assignment"
      "给 xxx 指派了任务："
    when "event_change_assignment"
      "把 xxx 的任务指派给 xxx："
    when "event_modify_end_time"
      "将任务完成时间从 xxx 修改为 xx："
    when "event_comment"
      "回复了任务："
    end
  end
end
