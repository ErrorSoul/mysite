# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(
  email: 'afinance.dev+admin@gmail.com',
  password: 'Adminadmin1'
  )

%w(
  main
  nska
  hotey
  isu_capital
  capital_investment
  strategic
  isu_ai
).each do |name|
  Fund.create!(name: name, content: '')
end
