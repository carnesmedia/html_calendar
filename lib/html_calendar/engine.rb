module HTMLCalendar
  class Engine < ::Rails::Engine
    initializer 'html_calendar.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper HtmlCalendarHelper
      end
    end
  end
end
