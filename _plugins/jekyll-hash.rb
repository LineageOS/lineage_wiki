module Jekyll
  module HashFilter
    def values(input)
      input.values
    end
  end
end

Liquid::Template.register_filter(Jekyll::HashFilter)
