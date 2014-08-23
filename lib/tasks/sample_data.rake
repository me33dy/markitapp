namespace :db do
	desc "Generate sample data"
	task populate: :environment do
	make_users
	make_relationships
	end
end


def make_users
	User.create!(username: "Sample User",
				email: "sample@sample.com",
				password: "sample",
				password_confirmation: "sample")
	99.times do |n|
		name = Faker::Name.name
		email = "sample-#{n+1}@sample.com"
		password = "password"
		User.create!(name: name,
					email: email,
					password: password)
	end
end

def make_relationships
	users = User.all
	user = User.first
	followed_users = users[2..50]
	followers = users[3..40]
	followed_users.each { |followed| user.follow!(followed) }
	followers.each { |follower| follower.follow!(user) }
end