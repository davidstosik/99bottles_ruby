class Bottles
  BOTTLE_COUNT = 99

  def verse(num)
    "#{count_beers(num).capitalize} on the wall, " +
    "#{count_beers(num)}.\n" +
    action(num) +
    "#{count_beers((num-1) % 100)} on the wall.\n"
  end

  def verses(first, last)
    first.downto(last).map do |num|
      verse(num)
    end.join("\n")
  end

  def song
    verses(BOTTLE_COUNT, 0)
  end

  private

  def count_beers(num)
    case num
    when 0 then "no more bottles of beer"
    when 1 then "1 bottle of beer"
    else "#{num} bottles of beer"
    end
  end

  def action(num)
    if num == 0
      "Go to the store and buy some more, "
    else
      "Take #{num == 1 ? 'it' : 'one'} down and pass it around, "
    end
  end
end
