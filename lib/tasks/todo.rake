namespace :todo do
  desc "Deleted to-do items that haven't been deleted in more than 7 days"
  task delete_items: :environment do
      Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
