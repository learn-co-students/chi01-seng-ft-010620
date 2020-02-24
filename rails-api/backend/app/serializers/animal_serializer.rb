class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :gender

  def species
    @object.species.name
  end
end
