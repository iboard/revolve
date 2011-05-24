class Message < ActiveRecord::Base
  # string   "subject"
  # string   "body"
  # datetime "created_at"
  # datetime "updated_at"
  
  validates_presence_of :subject
  validates_presence_of :body
  validates_length_of   :body, minimum: 40
end
