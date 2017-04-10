defmodule Cards do
  # Use `mix docs` to create html file with tech documentaion
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
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
    # { hand, rest_of_deck } = Cards.deal(Cards.create_deck, 4)
    # this returns 2 arrays, kind of, so we pattern match the values to 2 variables like that
    # Ex.  color1  = ["red" ] --> color1 = ["red"]
    # Ex. [ color1 ] = ["red" ] --> color1 = "red"
    # You match up the
      Enum.split(deck, hand_size)
    end

    def save(deck, filename) do
    # create a file with the value of deck
    # :erlang provides many methods
      binary = :erlang.term_to_binary(deck)
      File.write(filename, binary)
    end



    # Pattern matching
    # color = "red"
    # [color] = ["red"]
    # ["red", color] = ["red", "blue"] ---> :ok
    # ["red", color] = ["green", "blue"] ---> :error, for hardcoded on the left side, it must match the right one

#    def load(filename) do
#      {status, binary} = File.read(filename)
#
#      case status do
#        :ok -> :erlang.binary_to_term(binary)
#        :error -> "That file doesnt exists"
#      end
#    end

# override of the method above
# _reason, undescore helps us for pattern matching and to remove the warning from elixir that the variable is not used
    def load(filename) do
      case File.read(filename) do
        {:ok, binary} -> :erlang.binary_to_term(binary)
        {:error, _reason} -> "That file doesnt exists"
      end
    end

    def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
    end
end
