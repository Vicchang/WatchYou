class RemoveAttributesFromSchedules < ActiveRecord::Migration
  def change
		remove_column :schedules, :reminddate
		remove_column :schedules, :remindtime
  end
end
