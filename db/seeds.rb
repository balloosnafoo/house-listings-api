File.foreach('./listings.csv') do |line|
  line = line.split(",")
  street, status, price, bedrooms = line[1], line[2], line[3], line[4]
  bathrooms, sq_ft, lng, lat = line[5], line[6], line[7], line[8]
  puts "ID: #{line[0]}"
  Listing.create!(
    street: street, status: status, price: price, bedrooms: bedrooms,
    bathrooms: bathrooms, sq_ft: sq_ft, lng: lng, lat: lat
  )
end
