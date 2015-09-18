json.type "FeatureCollection"
json.features do
  json.array! @listings do |listing|
    json.type "feature"
    json.geometry do
      json.type "point"
      json.coordinates [listing.lng, listing.lat]
    end
    json.properties do
      json.extract! listing, :id, :street, :status,
                             :price, :bedrooms, :bathrooms, :sq_ft
    end
  end
end
