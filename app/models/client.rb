class Client < ApplicationRecord
  EMAIL_REGEXP = /\w+@[a-z]+\.[a-z]+/
  PHONE_REGEXP = /(\+375|80)\s(29|33|44)\s\d{3}-?\s?\d{2}-?\s?\d{2}/
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :comments
  

  # after_find { |client| puts "You have found an object!" }
  # after_initialize { |client| puts "You have initialized an object!" }
  after_destroy :destroy_action
  after_save :success
  after_create :success 
  after_create_commit :client_saved_to_db

  validates :first_name, :last_name,
            :email, :phone, presence: true

  validates :first_name, :last_name, 
            length: { minimum: 3, message: 'Input correct please name category' }

  validates :email,
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEXP, message: 'Email invalid' },
            length: { minimum: 4, maximum: 254 }

  validates :phone, format: { with: PHONE_REGEXP, message: 'Phone invalid' }

  private 

  def destroy_action
    puts 'Client success deleted'
  end

  def success
    puts "Client was succes save"
  end

  def client_saved_to_db
    puts 'Client was success saved to database'
  end
end
