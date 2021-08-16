class Thing < ApplicationRecord
  def as_json(options = {})
    super(only: %i[id name])
  end
end
