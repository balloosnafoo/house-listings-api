class Listing < ActiveRecord::Base
  validates :street, :status, :price, :bedrooms, :bathrooms, :sq_ft,
            :lat, :lng, presence: true

  def self.filter_by_query(params)
    listings = Listing.all
    params.each do |key, val|
      next unless match = key.to_s.match(/[min|max]\_(.*)/)
      column = to_column_name(match[1])
      next unless column_names.include?(column)
      return nil unless comparator = get_query_comparator(key)
      listings = listings.where("#{column} #{comparator} ?", val)
    end
    listings
  end

  private
  def self.get_query_comparator(key)
    if key =~ /min/
      ">="
    elsif key =~ /max/
      "<="
    end
  end

  def self.to_column_name(str)
    # Filters out strs that are columns but aren't numerical
    return nil if ["status, street"].include?(str)

    # Returns the actual colum name in cases where abbreviation is expected
    {"bed" => "bedrooms", "bath" => "bathrooms"}[str] || str
  end
end
