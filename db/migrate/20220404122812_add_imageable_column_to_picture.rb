# frozen_string_literal: true

class AddImageableColumnToPicture < ActiveRecord::Migration[7.0]
  def change
    add_column :pictures, :imageable_type, :string
    add_column :pictures, :imageable_id, :bigint

    add_index :pictures, %i[imageable_type imageable_id]
  end
end
