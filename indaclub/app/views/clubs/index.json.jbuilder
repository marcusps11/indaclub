json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :location, :description, :image
  json.url club_url(club, format: :json)
end
