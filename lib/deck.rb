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
    @all_cards = []
    sql = "SELECT text FROM "
    cards = (db_connection { |conn| conn.exec_params(sql + " #{color}_cards") }).to_a
    cards.each do |card|
      @all_cards << Card.new(card["text"])
    end
    @all_cards
  end

  def deal!
    collection.shift
  end


end
