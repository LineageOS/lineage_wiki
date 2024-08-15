module Jekyll
  module PPI
    def ppi(input, screen_size)
      h, w = input.split("x").map(&:to_i)
      ("%d" % (Math.sqrt((h ** 2) + (w ** 2)) / screen_size))
    end
  end
end

Liquid::Template.register_filter(Jekyll::PPI)
