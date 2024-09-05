# db/seeds.rb
puts "Start Seeds !!"
# Destroy all records to start fresh
ItemMeasurement.destroy_all
ItemCart.destroy_all
Item.destroy_all
Order.destroy_all
Client.destroy_all
User.destroy_all

# Create a user
user = User.create!(
  email: "rod@gmail.com", password: "123456"
  # In a real scenario, use Devise to encrypt passwords
)

# Create clients
clients = [
  { first_name: "John", last_name: "Doe", phone_number: "1234567890", address: "Casablanca maroc" },
  { first_name: "Jane", last_name: "Smith", phone_number: "0987654321", address: "Ain sebaa maroc" },
  { first_name: "Bob", last_name: "Brown", phone_number: "1122334455", address: "Dakhla maroc" },
  { first_name: "John", last_name: "Doe", phone_number: "1234567890", address: "Tanger maroc" },
  { first_name: "Jane", last_name: "Smith", phone_number: "0987654321", address: "Mohamedia maroc" },
  { first_name: "Bob", last_name: "Brown", phone_number: "1122334455", address: "Safi maroc" },
  { first_name: "John", last_name: "Doe", phone_number: "1234567890", address: "el jadida maroc" },
  { first_name: "Jane", last_name: "Smith", phone_number: "0987654321", address: "sale maroc" },
  { first_name: "Bob", last_name: "Brown", phone_number: "1122334455", address: "kenitra maroc" }
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
    ItemCart.create!(status: "In Progress", deadline: Date.today + [2,3,4,5,6,9,12,14,15].sample.days, order: order, item: item)

    # Create measurements for each item
    measurements = [
      { title: "Chest", dimensions: "#{rand(36..44).to_f}", client: client },
      { title: "Waist", dimensions: "#{rand(36..44).to_f}" , client: client },
      { title: "Length", dimensions: "#{rand(36..44).to_f}" , client: client },
      { title: "Shoulder", dimensions: "#{rand(16..22).to_f}", client: client },
      { title: "Hip", dimensions: "#{rand(36..44).to_f}", client: client },
      { title: "Sleeve Length", dimensions: "#{rand(22..28).to_f}", client: client },
      { title: "Neck", dimensions: "#{rand(14..18).to_f}", client: client },
      { title: "Thigh", dimensions: "#{rand(20..26).to_f}", client: client },
      { title: "Inseam", dimensions: "#{rand(30..36).to_f}", client: client },
      { title: "Armhole", dimensions: "#{rand(18..24).to_f}", client: client },
      { title: "Cuff", dimensions: "#{rand(8..12).to_f}", client: client },
      { title: "Rise", dimensions: "#{rand(8..14).to_f}", client: client },
      { title: "Knee", dimensions: "#{rand(14..18).to_f}", client: client },
    ]

    measurements.each do |measurement_data|
      ItemMeasurement.create!(measurement_data)
    end
  end
end

puts "Seeds generated successfully!"
