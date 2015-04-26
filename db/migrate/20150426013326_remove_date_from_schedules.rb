class RemoveDateFromSchedules < ActiveRecord::Migration
  def change
		remove_column :schedules, :date
  end
end
