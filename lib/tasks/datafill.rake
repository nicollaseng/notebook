namespace :datafill do
  desc "Fill all database with faker datas"
  task seed: :environment do

  	1000.times do |i|
  		Contact.create(name: Faker::Name.name,
	  					email: Faker::Internet.email,
	  					kind: Kind.all.sample,
	  					rmk: Faker::Lorem.paragraph(2))
  	end

  	Contact.all.each do |cont|
  		Address.create(street:Faker::Address.street_address,
  						city: Faker::Address.city,
  						state:Faker::Address.state,
  						contact: cont)
  	end

  	Contact.all.each do |contacts|
  		Random.rand(0..5).times do |i|
	  		Phone.create(phone:Faker::PhoneNumber.cell_phone,
	  						contact: contacts)
	  	end
  	end
  end
end


