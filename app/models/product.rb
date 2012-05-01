class Product
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :price, :type => Integer
  
  validates :name, :uniqueness => true
  validates_presence_of :description, :price
end
