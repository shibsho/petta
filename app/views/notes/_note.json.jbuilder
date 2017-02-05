json.extract! note, :id, :image, :category, :content, :created_at, :updated_at
json.url note_url(note, format: :json)