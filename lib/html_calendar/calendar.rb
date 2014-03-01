module HTMLCalendar
  class Calendar
    attr_reader :template, :month, :options

    def initialize(template, month, options = {})
      @template = template
      @month = Month.new(month)
      @options = options
    end

    delegate :date_range,
      to: :month

    def to_s
      render 'calendar', calendar: self
    end

    def renderable_date_range
      beginning_of_month.at_beginning_of_week(:sunday)..end_of_month.at_end_of_week(:sunday)
    end

    def renderable_date_range_in_weeks
      renderable_date_range.to_a.in_groups_of(7)
    end

    def render_header
      render 'header', month: month
    end

    def render_date(date)
      partial_name = in_month?(date) ? 'day' : 'other_month_day'
      render partial_name, date: date, presenter: date_presenter_for(date)
    end

    def in_month?(date)
      date_range.include? date
    end

    def prefix
      self.class.name.underscore
    end

    private

    def date_presenter_for(date)
      options.fetch(:presenter, DatePresenter).new(template, date)
    end

    def render(partial, locals)
      partial_path = [prefix, partial].join('/')
      template.render partial: partial_path, locals: locals.merge(calendar: self)
    end

    def beginning_of_month
      month.at_beginning_of_month
    end

    def end_of_month
      month.at_end_of_month
    end
  end
end
