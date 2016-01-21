class AddImageColumntsToArticles < ActiveRecord::Migration
  def change
	  	def up
	    	add_attachment :articles, :image
	  	end

		def down
			remove_attachment :articles, :image
		end
  end
end
