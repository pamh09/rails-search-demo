class CreateBackupMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :backup_media do |t|
      t.string :name

      t.timestamps
    end
  end
end
