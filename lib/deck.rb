class Deck

  attr_accessor :collection, :color

  def initialize(color)
    @color = color
    @collection = get_cards
    @collection.shuffle!
  end

  def db_connection
    begin
      connection = PG.connect(dbname: "cards_against_humanity")
      yield(connection)
    ensure
      connection.close
    end
  end

  def get_cards
    if @color == "white"
      sql = "SELECT text FROM white_cards"
    else
      sql = "SELECT text FROM black_cards WHERE pick = 1"
    end
    @all_cards = []
    cards = (db_connection { |conn| conn.exec_params(sql) }).to_a
    cards.each do |card|
      @all_cards << Card.new(card["text"])
    end
    @all_cards
  end

  def deal!
    collection.shift
  end


end
