module HTMLCalendar
  class Month

    def initialize(date)
      @date = date.at_beginning_of_month.to_date
    end

    def date_range
      at_beginning_of_month..at_end_of_month
    end

    delegate :to_date, :at_beginning_of_month, :at_end_of_month,
      to: :date

    private
    # Date stores the first of the month
    attr_reader :date
  end

end
