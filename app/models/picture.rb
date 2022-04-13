# frozen_string_literal: true

class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_many :comments

  validates :name, length:
            { minimum: 3, maximum: 254,
              message: 'Input please correct name' }

  after_create_commit :client_saved_to_db
  before_save :normalized_name

  private

  def normalized_name
    if name == name.capitalize
      name
    else
      name.capitalize
    end
    # name == name.capitalize! ? name = name.capitalize! : false
  end

  def client_saved_to_db
    puts 'Client was success saved to database'
  end
end
