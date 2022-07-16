class Bottles
  BOTTLE_COUNT = 99

  class Verse
    def initialize(num)
      @num = num
    end

    def to_s
      "#{count_beers.capitalize} on the wall, " +
      "#{count_beers}.\n" +
      action +
      "#{count_beers_after} on the wall.\n"
    end

    private

    attr_reader :num

    def count_beers(num = self.num)
      case num
      when 0 then "no more bottles of beer"
      when 1 then "1 bottle of beer"
      else "#{num} bottles of beer"
      end
    end

    def count_beers_after
      count_beers((num - 1) % 100)
    end

    def action
      if num == 0
        "Go to the store and buy some more, "
      else
        "Take #{num == 1 ? 'it' : 'one'} down and pass it around, "
      end
    end
  end

  def verse(num)
    Verse.new(num).to_s
  end

  def verses(first, last)
    first.downto(last).map do |num|
      verse(num)
    end.join("\n")
  end

  def song
    verses(BOTTLE_COUNT, 0)
  end
end
