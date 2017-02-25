    class BackupMedium < ApplicationRecord
	  belongs_to :backup_type
      has_many :backups
      has_many :components, :through => :backups
    end
