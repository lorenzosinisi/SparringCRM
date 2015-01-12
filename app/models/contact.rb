class Contact < ActiveRecord::Base
	
	has_one  :status
	belongs_to  :user

end
