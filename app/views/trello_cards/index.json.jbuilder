json.array!(@trello_cards) do |trello_card|
  json.extract! trello_card, :id, :card_id, :shortlink
  json.url trello_card_url(trello_card, format: :json)
end
