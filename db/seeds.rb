last_name = '山田'
first_name = '太郎'
email = 'admin@example.com'
birthday = '1981-04-15'
sex = 2
password = "test!hoge"
admin = true

User.create!(
  last_name: last_name,
  first_name: first_name,
  email: email,
  birthday: birthday,
  sex: 2,
  password: password,
  password_confirmation: password,
  admin: admin
)
