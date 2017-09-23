#create users
users = %w(Amar Akbar Anthony).to_a.map do |name|
  User.create! username: name, email: name + "@example.com", password: 'abcd1234'
end

# Starter set for Events
events = Array[
  (Event.create! name: "Lunch"),
  (Event.create! name: "Dinner"),
  (Event.create! name: "Snacks")
]