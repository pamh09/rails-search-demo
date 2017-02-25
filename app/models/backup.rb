    class Backup < ApplicationRecord
        belongs_to :component
        belongs_to :backup_medium
		

	#---- code below does not work ---
	# in pry
	# pry(Backup):1> by_media('bak').any?
	# (0.0ms) SELECT COUNT(*) FROM "backups" WHERE (backup_media = 'bak')
	# ActiveRecord::StatementInvalid: SQLite3::SQLException: no such column: backup_media.name:  SELECT COUNT(*) FROM "backups" WHERE (backup_media.name = 'bak')
	
	def self.my_includes
          includes(:component, :backup_medium)
        end

        def self.by_component(name)
          my_includes.where("components.name = ?", name)
        end

        def self.by_media(name)
          my_includes.where("backup_media.name  = ?", name)
        end

        def self.search_by(name)
          by_component(name).any? ? by_component_name : by_media_name
        end

	# ----- code below works ... call search('string') -----
	# I was unable to get the like query to work without using #{name}
		
        def self.by_component_like(name)
	  # Note: joins (singular).where (plural.column ...)
          joins(:component).where("components.name like '%#{name}%'")
        end

        def self.by_media_like(name)
          joins(:backup_medium).where("backup_media.name like '%#{name}%'")
        end

        def self.search(name)
          by_component_like(name).any? ? by_component_like(name) : by_media_like(name)
        end

    end
