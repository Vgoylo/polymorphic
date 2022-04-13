# frozen_string_literal: true

# Add clients
20.times do |t|
  Client.create(
    first_name: "First name #{t}",
    last_name: "Last name #{t}",
    email: "example#{t}@example.com",
    phone: '+375 29 883 26 36'
  )
end

puts 'Clients have been created'

# Add products
%w[Phone Notebook Refrigerator].each do |product_name|
  Product.create(
    name: product_name,
    description: "This is #{product_name} very good"
  )
end

puts 'Products have been created'

# # Add pictures
# %w[cool happy sience horror funny interesting].each do |tag_name|
#   Tag.create!(name: tag_name)
# end

# #Add comments

puts 'Comments have been created'
