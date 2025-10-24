module Jekyll
  module RemoveLineFilter
    def remove_line(input, line)
      input.split("\n", -1).reject { |x| x == line }.join("\n")
    end
  end
end

Liquid::Template.register_filter(Jekyll::RemoveLineFilter)
