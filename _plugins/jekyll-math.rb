module Jekyll
  module MathFilter
    def count_ints(value)
      value.map(&:to_i).uniq.count
    end

    def in_to_mm(value)
      (value * 25.4).round(2).to_s().chomp('.0')
    end

    def mm_to_in(value)
      (value / 25.4).round(2).to_s().chomp('.0')
    end

    def ppi(input, screen_size)
      h, w = input.split("x").map(&:to_i)
      ("%d" % (Math.sqrt((h ** 2) + (w ** 2)) / screen_size))
    end

    # https://stackoverflow.com/a/60243022
    def precision(input, value=0)
      ("%.#{value}f" % input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::MathFilter)
