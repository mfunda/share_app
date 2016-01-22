class Article < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "1000x550#", thumb: "350x250>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	belongs_to :user
  	has_many :comments
  	acts_as_votable
end
