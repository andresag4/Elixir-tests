defmodule Cards do
    def hello do
      'hi there!'
    end

    def create_deck do
      values = ["a", "b", "c", "d", "e", "f"]
      suits = ["spades", "clubs", "hearts", "diamonds"]

      # solution 1
      cards = for suit <- suits do
        for value <- values do
          "#{value} #{suit}"
        end
      end

      List.flatten(cards)

      # solution 2
      for suit <- suits, value <- values do
        "#{value} #{suit}"
      end
    end

    def shuffle(deck) do
      Enum.shuffle(deck)
    end

    def contains?(deck, card) do
      Enum.member?(deck, card)
    end

    def deal(deck, hand_size) do
    # returns a tupla
      Enum.split(deck, hand_size)
    end
end
