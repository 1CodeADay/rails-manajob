# db/seeds.rb

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
    { title: "Suit", fabric: "Silk", specifications: "Gray, tailored fit", item_type: "Suit", price: 200.0, deposit: 80.0, balance: 120.0 }
  ]

  items.each do |item_data|
    item = Item.create!(item_data)
    ItemCart.create!(status: "In Progress", deadline: Date.today + 21.days, order: order, item: item)

    # Create measurements for each item
    measurements = [
      { title: "Chest", dimensions: "#{rand(36..44).to_f}", item: item },
      { title: "Waist", dimensions: "#{rand(36..44).to_f}" , item: item },
      { title: "Length", dimensions: "#{rand(36..44).to_f}" , item: item },
    ]

    measurements.each do |measurement_data|
      ItemMeasurement.create!(measurement_data)
    end
  end
end

puts "Seeds generated successfully!"
