class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :sender_id, type: String
  field :recipient_id, type: String

  belongs_to :sender, foreign_key: "sender_id", class_name: 'User', :inverse_of => :conversations
  belongs_to :recipient, foreign_key: "recipient_id", class_name: 'User'

  has_many :messages

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  # scope :involving, -> any_of({sender_id: user.id}, {recipient_id: user.id})

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND 
      conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

end
