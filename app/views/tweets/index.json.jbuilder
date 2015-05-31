json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :ciudad, :text, :created_at, :favorite_count, :lang, :etiqueta, :porcentaje
  json.url tweet_url(tweet, format: :json)
end