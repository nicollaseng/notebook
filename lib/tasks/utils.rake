namespace :utils do
  desc "Preencher o banco de dados"
  task seed: :environment do
  	puts "Criando Contatos"
	1000.times do |i|
		Contact.create!([{name: Faker::Name.name,
									email:Faker::Internet.email,
									kind: Kind.all.sample,
									rmk: Faker::Lorem.paragraphs(1)}
									])
	end
	Contact.all.each do |contact|
				Address.create!([{street:Faker::Address.street_address,
								  city:Faker::Address.city,
								  state:Faker::Address.state,
								  contact: contact}])
	end

	Contact.all.each do |cont|
		Phone.create!([{phone: Faker::PhoneNumber.phone_number,
						contact: cont}])
	end

  end
end
