class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	attr_accessor :str_sex
	devise :database_authenticatable, :registerable,
    	:recoverable, :rememberable, :trackable, :validatable
    has_many :comments
    has_many :articles
    has_attached_file :avatar, styles: { medium: "550x350#", thumb: "250x200>" }, default_url: "missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	acts_as_followable
	acts_as_follower

  	def set_sex
  		@user = User.find(self.id)
  		if @user.sex == true
  			@user.str_sex = 'Male'
  		else
  			@user.str_sex = 'Female'
  		end
  	end
end
