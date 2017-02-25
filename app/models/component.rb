    class Component < ApplicationRecord
      has_many :backups
      has_many :backup_media, :through => :backups
    end
