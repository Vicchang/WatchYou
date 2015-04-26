class AddAttributesToSchedulesThird < ActiveRecord::Migration
  def change
 		add_column :schedules, :remind_date, :string
		add_column :schedules, :remind_time, :string
  end
end
