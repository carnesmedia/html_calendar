module HTMLCalendarHelper
  def html_calendar(month = Date.current, options = {})
    HTMLCalendar::Calendar.new self, month, options
  end
end
