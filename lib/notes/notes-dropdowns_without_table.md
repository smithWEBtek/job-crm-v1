notes-dropdowns_without_table.md


http://stackoverflow.com/questions/637787/rails-non-table-drop-down-list


Why create a model? Just use select.

DAYS = ['Monday', 'Tuesday', 'Wednesday', ...]
select(:event, :day, DAYS)
It's usually better practice to place the constant in the relevant model and use it from there.

In your model:

class Event < ActiveRecord::Base
  DAYS = ['Monday', 'Tuesday', 'Wednesday', ...]
end
and then in your view:

select(:event, :day, Event::DAYS)
and here's another trick I use a lot:

select(:event, :day, Event::DAYS.collect {|d| [d, Event::DAYS.index(d)]})