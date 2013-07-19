json.array!(@items) do |item|
  json.extract! item, :title, :total, :subtitle, :author, :category, :url, :image, :description
  json.url item_url(item, format: :json)
end
