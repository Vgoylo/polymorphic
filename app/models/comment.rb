# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :client
  belongs_to :picture
end
