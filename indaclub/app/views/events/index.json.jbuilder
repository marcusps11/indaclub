json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :ticketlink
  json.url event_url(event, format: :json)
end
