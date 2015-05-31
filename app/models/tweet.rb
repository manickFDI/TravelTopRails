class Tweet
  include Mongoid::Document
  field :source, type: String
  field :text, type: String
  field :created_at, type: String
  field :favorite_count, type: Float
  field :lang, type: String
  field :etiqueta, type: String
  field :porcentaje, type: String
  field :valorado, type: Boolean, default: false
end