json.array!(@contacts) do |contact|
  json.extract! contact, :id, :state, :value, :name, :note, :assigned_to, :email, :phone
  json.url contact_url(contact, format: :json)
end
