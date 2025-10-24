module Jekyll
  module RemoveLineFilter
    def remove_line(input, line)
      input.sub! "\n#{line}", ""
      input.sub! "#{line}\n", ""
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::RemoveLineFilter)
