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

# Image URLs for clients
image_urls = [
  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",

  "https://plus.unsplash.com/premium_photo-1710911198710-3097c518f0e1?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
  "https://images.unsplash.com/photo-1517630800677-932d836ab680?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",

  "https://plus.unsplash.com/premium_photo-1710911198710-3097c518f0e1?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
  "https://images.unsplash.com/photo-1517630800677-932d836ab680?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D"
]

clients = [
  { first_name: "Ahmed", last_name: "El Mansouri", phone_number: "0661122334", address: "Rue Al Atlas, Casablanca Maroc" },
  { first_name: "Fatima", last_name: "Benjelloun", phone_number: "0665566778", address: "Avenue Hassan II, Rabat Maroc" },
  { first_name: "Mohamed", last_name: "Alaoui", phone_number: "0655443322", address: "Boulevard Mohammed V, Marrakech Maroc" },
  { first_name: "Sara", last_name: "El Fassi", phone_number: "0642233445", address: "Quartier Souissi, Rabat Maroc Maroc" },
  { first_name: "Khalid", last_name: "Bakkali", phone_number: "0677788990", address: "Quartier Maârif, Casablanca Maroc" },
  { first_name: "Naima", last_name: "Zahraoui", phone_number: "0633445566", address: "Avenue Lalla Yacout, Fès Maroc" },
  { first_name: "Yassine", last_name: "El Idrissi", phone_number: "0688221144", address: "Boulevard Hassan II, Tanger Maroc" },
  { first_name: "Laila", last_name: "Ouazzani", phone_number: "0612334455", address: "Route de Safi, El Jadida Maroc" },
  { first_name: "Hicham", last_name: "Taleb", phone_number: "0655123446", address: "Quartier Souk, Oujda Maroc" }
]

clients.each_with_index do |client_data, index|
  client = Client.create!(client_data)

  # Open the image file from the corresponding URL
  image_url = image_urls[index] # Each client gets a unique image
  file = URI.parse(image_url).open

  # Attach the photo to the client
  client.photo.attach(io: file, filename: "client_#{index + 1}.png", content_type: "image/png")

  # Save the client with the attached image
  client.save

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
  items.each do |item_data|
    item = Item.create!(item_data)
    ItemCart.create!(status: "In Progress", deadline: Date.today + [2,3,4,5,6,9,12,14,15].sample.days, order: order, item: item)

  end
end

puts "Seeds generated successfully!"
