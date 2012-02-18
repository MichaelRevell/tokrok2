class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :archiveID

      t.timestamps
    end
  end
end
