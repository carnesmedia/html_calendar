require 'spec_helper'

describe HTMLCalendar::Calendar do
  let(:template) { double(:template) }
  let(:html_calendar) { HTMLCalendar::Calendar.new(template, month) }
  let(:month) { Date.new(2013, 10, 1) }

  describe '#renderable_date_range' do
    it 'returns the last sunday of sept to the first sat of nov' do
      expected_range = Date.new(2013, 9, 29)..Date.new(2013, 11, 2)
      expect(html_calendar.renderable_date_range).to eq expected_range
    end
  end

  describe '#renderable_date_range_in_weeks' do
    it 'returns an array of ranges for each week' do
      expected = [
        Date.new(2013, 9, 29)..Date.new(2013, 10, 5),
        Date.new(2013, 10, 6)..Date.new(2013, 10, 12),
        Date.new(2013, 10, 13)..Date.new(2013, 10, 19),
        Date.new(2013, 10, 20)..Date.new(2013, 10, 26),
        Date.new(2013, 10, 27)..Date.new(2013, 11, 2),
      ].map(&:to_a)

      expect(html_calendar.renderable_date_range_in_weeks).to eq expected
    end

    context 'in december' do
      let(:month) { Date.new(2013, 12, 1) }
      it 'returns an array of ranges for each week (starting on dec 1)' do
        expected = [
          Date.new(2013, 12, 1)..Date.new(2013, 12, 7),
          Date.new(2013, 12, 8)..Date.new(2013, 12, 14),
          Date.new(2013, 12, 15)..Date.new(2013, 12, 21),
          Date.new(2013, 12, 22)..Date.new(2013, 12, 28),
          Date.new(2013, 12, 29)..Date.new(2014, 1, 4),
        ].map(&:to_a)

        expect(html_calendar.renderable_date_range_in_weeks).to eq expected
      end
    end
  end

  describe '#in_month?' do
    subject { html_calendar.in_month? date }

    context 'with a day in october' do
      let(:date) { Date.new(2013, 10, 20) }
      it { should be_true }
    end

    context 'with the first day' do
      let(:date) { Date.new(2013, 10, 1) }
      it { should be_true }
    end

    context 'with a day in november' do
      let(:date) { Date.new(2013, 11, 1) }
      it { should be_false }
    end

    context 'with a day in october last year' do
      let(:date) { Date.new(2012, 10, 20) }
      it { should be_false }
    end
  end
end
