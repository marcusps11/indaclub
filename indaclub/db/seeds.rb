require 'httparty'
#Clear the database
Event.delete_all
Club.delete_all

URL = "http://api.gigatools.com/"
API_KEY = "c8dff564d25bbf7276"



def get_api_result city, type=nil
  uri = if type.nil? || type == :s
    "city.json?cities[]=#{city}&api_key=#{API_KEY}"
  elsif type == :id 
    "city.json?cities[]=#{city}&api_key=#{API_KEY}"
  end
   HTTParty.get URL + URI.encode(uri)
end

result = get_api_result("Ibiza")

json_result = JSON.parse(result)

json_result[1].each do |event|
  club = Club.find_or_create_by(name: event['venue'])
  new_event = Event.create(name: event['event_owner'], club_id: club.id, date: event['eventdate'])
end



