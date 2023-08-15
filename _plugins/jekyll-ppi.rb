module Jekyll
  module PPI
    def ppi(input, screen_size)
      h, w = input.split("x")
      ("%d" % (Math.sqrt((h.to_i ** 2) + (w.to_i ** 2)) / screen_size))
    end
  end
end

Liquid::Template.register_filter(Jekyll::PPI)
