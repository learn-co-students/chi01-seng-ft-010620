class TrainerSerializer < ActiveModel::Serializer
  attributes :id, :name, :pokemons

  def pokemons
    @object.pokemons
  end
end
