# db/seeds.rb

# Destroy all records to start fresh
ItemMeasurement.destroy_all
ItemCart.destroy_all
Item.destroy_all
Order.destroy_all
Client.destroy_all
User.destroy_all

# Reset primary keys (optional, depends on your database)
ActiveRecord::Base.connection.reset_pk_sequence!('item_measurements')
ActiveRecord::Base.connection.reset_pk_sequence!('item_carts')
ActiveRecord::Base.connection.reset_pk_sequence!('items')
ActiveRecord::Base.connection.reset_pk_sequence!('orders')
ActiveRecord::Base.connection.reset_pk_sequence!('clients')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

# Create a user
user = User.create!(
  email: "rod@gmail.com", password: "123456"
  # In a real scenario, use Devise to encrypt passwords
)

# Create clients
clients = [
  { first_name: "John", last_name: "Doe", phone_number: "1234567890", address: "123 Tailor St" },
  { first_name: "Jane", last_name: "Smith", phone_number: "0987654321", address: "456 Seam Rd" },
  { first_name: "Bob", last_name: "Brown", phone_number: "1122334455", address: "789 Fabric Ln" },
  { first_name: "Alice", last_name: "Smith", phone_number: "2233445566", address: "456 Oak St" },
  { first_name: "John", last_name: "Doe", phone_number: "3344556677", address: "123 Pine Ave" },
  { first_name: "Emma", last_name: "Johnson", phone_number: "4455667788", address: "987 Elm Dr" },
  { first_name: "Michael", last_name: "Williams", phone_number: "5566778899", address: "321 Birch Rd" },
  { first_name: "Olivia", last_name: "Jones", phone_number: "6677889900", address: "654 Maple Blvd" },
  { first_name: "Liam", last_name: "Garcia", phone_number: "7788990011", address: "789 Cedar St" },
  { first_name: "Sophia", last_name: "Martinez", phone_number: "8899001122", address: "246 Spruce Ln" },
  { first_name: "Noah", last_name: "Rodriguez", phone_number: "9900112233", address: "135 Redwood Pl" },
  { first_name: "Ava", last_name: "Davis", phone_number: "1011223344", address: "852 Fir Ct" },
  { first_name: "James", last_name: "Miller", phone_number: "1122334466", address: "369 Sycamore Ln" },
]

clients.each do |client_data|
  client = Client.create!(client_data)

  # Create an order for each client
  order = Order.create!(status: "Pending", user: user, client: client)

  # Create items with measurements for each client
  items = [
    { title: "Shirt 1", fabric: "Cotton", specifications: "Blue, slim fit", item_type: "Shirt", price: 50.0, deposit: 20.0, balance: 30.0 },
    { title: "Shirt 2", fabric: "Linen", specifications: "White, regular fit", item_type: "Shirt", price: 60.0, deposit: 25.0, balance: 35.0 },
    { title: "Trousers", fabric: "Wool", specifications: "Black, straight fit", item_type: "Trousers", price: 80.0, deposit: 30.0, balance: 50.0 },
    { title: "Jacket", fabric: "Wool", specifications: "Navy, slim fit", item_type: "Jacket", price: 150.0, deposit: 60.0, balance: 90.0 },
    { title: "Blazer", fabric: "Linen", specifications: "Beige, relaxed fit", item_type: "Blazer", price: 180.0, deposit: 70.0, balance: 110.0 },
    { title: "Trousers", fabric: "Cotton", specifications: "Black, straight fit", item_type: "Trousers", price: 100.0, deposit: 40.0, balance: 60.0 },
    { title: "Shirt", fabric: "Silk", specifications: "White, regular fit", item_type: "Shirt", price: 80.0, deposit: 30.0, balance: 50.0 },
    { title: "Overcoat", fabric: "Wool", specifications: "Gray, double-breasted", item_type: "Overcoat", price: 250.0, deposit: 100.0, balance: 150.0 },
    { title: "Vest", fabric: "Polyester", specifications: "Navy, tailored fit", item_type: "Vest", price: 70.0, deposit: 25.0, balance: 45.0 },
    { title: "Dress", fabric: "Silk", specifications: "Red, A-line", item_type: "Dress", price: 220.0, deposit: 85.0, balance: 135.0 },
    { title: "Skirt", fabric: "Cotton", specifications: "Black, pencil fit", item_type: "Skirt", price: 90.0, deposit: 35.0, balance: 55.0 },
    { title: "Blouse", fabric: "Linen", specifications: "Pink, regular fit", item_type: "Blouse", price: 70.0, deposit: 25.0, balance: 45.0 },
    { title: "Pants", fabric: "Denim", specifications: "Blue, relaxed fit", item_type: "Pants", price: 120.0, deposit: 50.0, balance: 70.0 },
  ]

  items.each do |item_data|
    item = Item.create!(item_data)
    ItemCart.create!(status: "In Progress", deadline: Date.today + 21.days, order: order, item: item)

    # Create measurements for each item
    measurements = [
      { title: "Chest", dimensions: "#{rand(36..44).to_f}", item: item },
      { title: "Waist", dimensions: "#{rand(36..44).to_f}" , item: item },
      { title: "Length", dimensions: "#{rand(36..44).to_f}" , item: item },
      { title: "Shoulder", dimensions: "#{rand(16..22).to_f}", item: item },
      { title: "Hip", dimensions: "#{rand(36..44).to_f}", item: item },
      { title: "Sleeve Length", dimensions: "#{rand(22..28).to_f}", item: item },
      { title: "Neck", dimensions: "#{rand(14..18).to_f}", item: item },
      { title: "Thigh", dimensions: "#{rand(20..26).to_f}", item: item },
      { title: "Inseam", dimensions: "#{rand(30..36).to_f}", item: item },
      { title: "Armhole", dimensions: "#{rand(18..24).to_f}", item: item },
      { title: "Cuff", dimensions: "#{rand(8..12).to_f}", item: item },
      { title: "Rise", dimensions: "#{rand(8..14).to_f}", item: item },
      { title: "Knee", dimensions: "#{rand(14..18).to_f}", item: item },
    ]

    measurements.each do |measurement_data|
      ItemMeasurement.create!(measurement_data)
    end
  end
end

puts "Seeds generated successfully!"
