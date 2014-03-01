module HTMLCalendarHelper
  def html_calendar(month, options = {})
    HTMLCalendar::Calendar.new self, month, options
  end
end
