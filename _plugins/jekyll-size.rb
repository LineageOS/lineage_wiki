module Jekyll
  module Size
    def in_to_mm(value)
      (value * 25.4).round(2).to_s().chomp(".0")
    end

    def mm_to_in(value)
      (value / 25.4).round(2).to_s().chomp(".0")
    end
  end
end

Liquid::Template.register_filter(Jekyll::Size)
