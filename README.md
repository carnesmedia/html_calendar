# HtmlCalendar

HtmlCalendar is an extremely lightweight/extensible gem for creating HTML
calendars in Rails (>= 3.1).

Want to overwrite the built-in views? No problem. Want clean markup? It'll give
you clean markup. Want a full-featured Google Calendar clone? It'll give you
clean markup.

## Installation

1. Add `gem "html_calendar"` to your `Gemfile`
2. `bundle`

## Creating calendars

The `html_calendar` helper makes it easy to create a calendar for any date:

```erb
<!-- a calendar for the current month -->
<%= html_calendar %>

<!-- a calender for 3 months in the future -->
<%= html_calendar Date.current + 3.months %>
```

If you need customized date logic, you can also pass `html_calendar` a presenter:

```erb
<%= html_calendar Date.current, presenter: MyCustomDatePresenter %>
```

Your presenter class needs to inherit from `HTMLCalendar::DatePresenter`, and
should implement the `html_classes` method.

```ruby
class MyCustomDatePresenter < HTMLCalendar::DatePresenter
  # Available methods: `html_classes`, `date` and `template`

  def html_classes
    if monday?
      ['a-case-of-the-mundays']
    else
      super
    end
  end

  private

  def monday?
    date.wday == 1
  end
end
```


## Overwriting views

You can overwrite any of the [view partials](https://github.com/carnesmedia/html_calendar/tree/master/app/views/html_calendar/calendar) by creating a directory at `app/views/html_calendar/calendar` and adding replacement files:

| Name                        | Description                                                 |
| -------------               |-------------                                                |
| `_calendar.html.erb`        | Main calendar loop                                          |
| `_day.html.erb`             | Single day cell (in current month)                          |
| `_header.html.erb`          | Table header (including day names)                          |
| `_other_month_day.html.erb` | Single day cell for days displayed but not in current month |


## Future Plans

* I18n support
* Better test coverage
* Basic stylesheet (opt-in)
* Ability to overwrite partial path
