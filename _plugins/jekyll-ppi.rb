module Jekyll
  module PPI
    def ppi(input, screen_size)
      x, y = input.split("x")
      ("%d" % (Math.sqrt((x.to_i ** 2) + (y.to_i ** 2)) / screen_size))
    end
  end
end

Liquid::Template.register_filter(Jekyll::PPI)
