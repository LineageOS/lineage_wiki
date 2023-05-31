module Jekyll
  module DeviceLinkFilter
    def device_link(input, page="", anchor="")
      if input == nil
        ("devices")
      elsif input['variant'] == nil
        ("devices/#{input['codename']}#{page}#{anchor}")
      else
        ("devices/#{input['codename']}#{page}/variant#{input['variant']}#{anchor}")
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::DeviceLinkFilter)
