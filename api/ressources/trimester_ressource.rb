class TrimesterRessource < Grape::Entity
  expose :year
  expose :category
  expose :term
  expose :slug
  expose :bachelors, using: BachelorRessource
end