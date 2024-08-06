namespace :users do
  desc "Add drivers to users who don't have one"
  task add_drivers: :environment do
    User.find_each do |user|
      unless user.driver
        driver = Driver.new(
          user: user,
          bio: "No bio yet",
          country: "Unknown"
        )
        if driver.save
          puts "Created driver for user #{user.id} (#{user.email})"
        else
          puts "Failed to create driver for user #{user.id} (#{user.email}): #{driver.errors.full_messages.join(', ')}"
        end
      else
        puts "Driver already exists for user #{user.id} (#{user.email})"
      end
    end
    puts "Finished adding drivers to users"
  end
end