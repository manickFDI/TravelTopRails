class Valoration
  include Mongoid::Document
  field :ciudad_v, type: String
  field :valorPositivo, type: Float
  field :valorNegativo, type: Float
  field :total, type: Float
  field :valor, type: Float
  field :numPos, type: Float
  field :numNeg, type: Float
  field :numNeutral, type: Float
end