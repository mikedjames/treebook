class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, uniqueness: true,
  						format: {
  							with: /\A[a-zA-Z0-9\-\_]+\Z/,
  							message: "Must be formatted correctly."
  						}


  has_many :statuses
  def full_name
  	first_name + " " + last_name
  end

  def gravatar_url
    stripped_email = email.strip #takes the email string, then removes any spaces before or after text
    downcased_email = stripped_email.downcase #sets the stripped email to all lowercase
    hash = Digest::MD5.hexdigest(downcased_email) #set  the stripped email to hashed code

    "http://gravatar.com/avatar/#{hash}" #last expression returns the url as the value

  end
end
