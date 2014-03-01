module HTMLCalendar
  class DatePresenter
    attr_reader :template, :date
    def initialize(template, date)
      @template, @date = template, date
    end

    def html_classes
      []
    end
  end
end
