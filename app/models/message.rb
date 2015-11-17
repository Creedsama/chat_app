class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id
end
