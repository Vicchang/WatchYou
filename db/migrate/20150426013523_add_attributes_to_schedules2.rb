class AddAttributesToSchedules2 < ActiveRecord::Migration
  def change
		add_column :schedules, :year, :string
		add_column :schedules, :month, :string
		add_column :schedules, :day, :string
		add_column :schedules, :remind_date, :string
		add_column :schedules, :remind_time, :string
		add_column :schedules, :ring, :string
		add_column :schedules, :submit, :string
		add_column :schedules, :accept, :string
		add_column :schedules, :image, :string
  end
end
