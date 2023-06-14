module Jekyll
  module DeviceLinkFilter
    def device_link(input, page="")
      if input == nil
        ("devices/")
      elsif input['variant'] == nil
        ("devices/#{input['codename']}#{page}")
      else
        ("devices/#{input['codename']}#{page}/variant#{input['variant']}")
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::DeviceLinkFilter)

