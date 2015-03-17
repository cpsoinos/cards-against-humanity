class Card < ActiveRecord::Base
  belongs_to :deck
end

class Deck < ActiveRecord::Base
  has_many :cards
end

class Player < ActiveRecord::Base

end
