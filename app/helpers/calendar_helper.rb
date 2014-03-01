module CalendarHelper
  def calendar(month, options = {})
    HTMLCalendar::Calendar.new self, month, options
  end
end
