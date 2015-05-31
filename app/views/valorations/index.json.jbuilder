json.array!(@valorations) do |valoration|
  json.extract! valoration, :id, :ciudad_v, :valorPositivo, :valorNegativo, :total, :valor, :numPos, :numNeg, :numNeutral, :created_at
  json.url valoration_url(valoration, format: :json)
end