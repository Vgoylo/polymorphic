# frozen_string_literal: true

class NormalizedName
  def self.before_save(product)
    return if product.name == product.name.capitalize

    product.name = product.name.capitalize
  end
end
