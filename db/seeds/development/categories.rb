require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create(:name => row[0], :parent_id => row[1])
end