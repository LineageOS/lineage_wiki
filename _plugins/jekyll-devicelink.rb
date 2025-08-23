module Jekyll
  module DeviceLinkFilter
    def device_link(input, page="")
      page = "/#{page}" unless page == nil || page.empty? || page.start_with?("/")

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
