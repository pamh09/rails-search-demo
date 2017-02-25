class CreateBackups < ActiveRecord::Migration[5.0]
  def change
    create_table :backups do |t|
      t.integer :component_id
      t.integer :backup_medium_id

      t.timestamps
    end
  end
end
