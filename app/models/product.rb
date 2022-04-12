class Product < ApplicationRecord
  has_many :pictures, as: :imageable, dependent: :destroy

  after_save_commit :success
  after_create :success
  after_update_commit :update_product_name, if: :update_product?
  after_destroy_commit :destroy_action

  # after_find { |product| puts "You have found an object!" }
  # after_initialize { |product| puts "You have initialized an object!" }

  validates :name, :description, 
            length: {minimum:3, maximum:254,
             message: 'Input please correct name'
            }
  before_save NormalizedName #class for inspect 

  private

  def update_product?
    name.match? /\A[A-z][a-zA-Z]+/
  end 

  def success
    puts "Product was succes save"
  end

  def destroy_action
    puts 'Your product success deleted'
  end

  def update_product_name
    puts 'Your product was success updated'
  end
end
