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


extra_image_urls = [
  ["https://unsplash.com/photos/a-woman-wearing-red-glasses-and-a-colorful-sweater-5VxCyV0Cf6o",
    "https://images.unsplash.com/photo-1505022610485-0249ba5b3675?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGZhc2hpb258ZW58MHwwfDB8fHww",
    "https://images.unsplash.com/photo-1493146146946-e907f69cdf23?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D"],
  ["https://plus.unsplash.com/premium_photo-1674777843430-3c0413584110?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8",
    "https://images.unsplash.com/photo-1483985988355-763728e1935b?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzaGlvbnxlbnwwfDB8MHx8fDA%3D",
    "https://plus.unsplash.com/premium_photo-1695575593603-1f42ca27bb6d?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZhc2hpb258ZW58MHwwfDB8fHww"],
    ["https://plus.unsplash.com/premium_photo-1689327920656-bcfe8a9709fa?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHx8",
      "https://images.unsplash.com/photo-1551489186-ccb95a1ea6a3?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGZhc2hpb258ZW58MHwwfDB8fHww",
      "https://images.unsplash.com/flagged/photo-1553802922-2eb2f7f2c65b?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGZhc2hpb258ZW58MHwwfDB8fHww"],
    ["https://unsplash.com/photos/a-woman-wearing-red-glasses-and-a-colorful-sweater-5VxCyV0Cf6o",
    "https://images.unsplash.com/photo-1505022610485-0249ba5b3675?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGZhc2hpb258ZW58MHwwfDB8fHww",
    "https://images.unsplash.com/photo-1493146146946-e907f69cdf23?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D"],
    ["https://plus.unsplash.com/premium_photo-1674777843430-3c0413584110?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8",
      "https://images.unsplash.com/photo-1483985988355-763728e1935b?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzaGlvbnxlbnwwfDB8MHx8fDA%3D",
      "https://plus.unsplash.com/premium_photo-1695575593603-1f42ca27bb6d?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZhc2hpb258ZW58MHwwfDB8fHww"],
    ["https://plus.unsplash.com/premium_photo-1689327920656-bcfe8a9709fa?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHx8",
      "https://images.unsplash.com/photo-1551489186-ccb95a1ea6a3?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGZhc2hpb258ZW58MHwwfDB8fHww",
      "https://images.unsplash.com/flagged/photo-1553802922-2eb2f7f2c65b?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGZhc2hpb258ZW58MHwwfDB8fHww"],
    ["https://unsplash.com/photos/a-woman-wearing-red-glasses-and-a-colorful-sweater-5VxCyV0Cf6o",
    "https://images.unsplash.com/photo-1505022610485-0249ba5b3675?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGZhc2hpb258ZW58MHwwfDB8fHww",
    "https://images.unsplash.com/photo-1493146146946-e907f69cdf23?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D"],
    ["https://plus.unsplash.com/premium_photo-1674777843430-3c0413584110?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8",
      "https://images.unsplash.com/photo-1483985988355-763728e1935b?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzaGlvbnxlbnwwfDB8MHx8fDA%3D",
      "https://plus.unsplash.com/premium_photo-1695575593603-1f42ca27bb6d?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZhc2hpb258ZW58MHwwfDB8fHww"],
    ["https://plus.unsplash.com/premium_photo-1689327920656-bcfe8a9709fa?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHx8",
      "https://images.unsplash.com/photo-1551489186-ccb95a1ea6a3?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGZhc2hpb258ZW58MHwwfDB8fHww",
      "https://images.unsplash.com/flagged/photo-1553802922-2eb2f7f2c65b?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGZhc2hpb258ZW58MHwwfDB8fHww"]
]


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

  extra_image_urls[index].each_with_index do |url, img_index|
    file = URI.parse(url).open
    client.pictures.attach(io: file, filename: "client_#{index + 1}_extra_#{img_index + 1}.png", content_type: "image/png")
  end

  # Save the client with the attached image
  client.save

  # Create an order for each client
  order = Order.create!(status: "Pending", user: user, client: client)

  # Create items with measurements for each client
  items = [
    { title: "Shirt 1", fabric: "Cotton", specifications: "Blue, slim fit", item_type: "Shirt", price: 50.0, deposit: 20.0, expenses: 10.0},
    { title: "Shirt 2", fabric: "Linen", specifications: "White, regular fit", item_type: "Shirt", price: 60.0, deposit: 25.0, expenses: 25.0},
    { title: "Trousers", fabric: "Wool", specifications: "Black, straight fit", item_type: "Trousers", price: 80.0, deposit: 30.0, expenses: 45.0},
    { title: "Jacket", fabric: "Wool", specifications: "Navy, slim fit", item_type: "Jacket", price: 150.0, deposit: 60.0, expenses: 75.0},
    { title: "Blazer", fabric: "Linen", specifications: "Beige, relaxed fit", item_type: "Blazer", price: 180.0, deposit: 70.0, expenses: 105.0},
    { title: "Trousers", fabric: "Cotton", specifications: "Black, straight fit", item_type: "Trousers", price: 100.0, deposit: 40.0, expenses: 15.0},

  ]
  # Create measurements for each item
    measurements = [
      { item_type: "Shirt", title: "Chest", dimensions: "#{rand(36..44).to_f}", client: client },
      { item_type: "Shirt", title: "Waist", dimensions: "#{rand(36..44).to_f}" , client: client },
      { item_type: "Shirt", title: "Length", dimensions: "#{rand(36..44).to_f}" , client: client },
      { item_type: "Shirt", title: "Shoulder", dimensions: "#{rand(16..22).to_f}", client: client },
      { item_type: "Shirt", title: "Hip", dimensions: "#{rand(36..44).to_f}", client: client },
      { item_type: "Shirt", title: "Sleeve Length", dimensions: "#{rand(22..28).to_f}", client: client },
    ]

    measurements.each do |measurement_data|
      ItemMeasurement.create!(measurement_data)
    end
  items.each do |item_data|
    item = Item.create!(item_data)
    ItemCart.create!(status: "In Progress", deadline: Date.today + [2, 3, 4, 5, 6, 9, 12, 14, 15].sample.days, order: order, item: item)
  end
end

puts "Seeds generated successfully!"
