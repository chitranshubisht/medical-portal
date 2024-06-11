# db/seeds.rb

User.create!(
  email: 'receptionist@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'receptionist'
)

User.create!(
  email: 'doctor@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'doctor'
)
