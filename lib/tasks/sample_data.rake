namespace :db do
	desc "Generate sample data"
	task populate: :environment do
	make_users
	make_relationships
	end
end


def make_users
	User.create!(username: "Sample User",
				email: "sample@simplesample.com",
				password: "sample",
				password_confirmation: "sample")
	99.times do |n|
		name = Faker::Name.name
		email = "sample-#{n+1}@sample.com"
		password = "password"
		User.create!(username: name,
					email: email,
					password: password)
	end
end

def make_relationships
	users = User.all
	user = User.first
	followed_users = users[10..60]
	followers = users[20..70]
	followed_users.each { |followed| user.follow!(followed) }
	followers.each { |follower| follower.follow!(user) }
end