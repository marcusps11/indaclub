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
  if /dc10/ =~ event["venue"].downcase
    club = Club.where("LOWER(name) LIKE?", "%dc10%").first
  elsif /amnesia/ =~ event["venue"].downcase
    club = Club.where("LOWER(name) LIKE?", "%amnesia%").first
  elsif /sankeys/ =~ event["venue"].downcase
    club = Club.where("LOWER(name) LIKE?", "%sankeys%").first
  elsif /space/ =~ event["venue"].downcase
    club = Club.where("LOWER(name) LIKE?", "%space%").first
  elsif /ushuaia/ =~ event["venue"].downcase
    club = Club.where("LOWER(name) LIKE?", "%ushuaia%").first
  elsif /eden/ =~ event["venue"].downcase
    club = Club.where("LOWER(name) LIKE?", "%eden%").first
  elsif /pacha/ =~ event["venue"].downcase
    club = Club.where("LOWER(name) LIKE?", "%pacha%").first
  else
    club = Club.where("LOWER(name) LIKE?", "%#{event["venue"].downcase}%").first
  end
  unless club.present?
    club = Club.create(name: event['venue'])
  end
  new_event = Event.create(name: event['event_owner'], club_id: club.id, date: event['eventdate'])
end


