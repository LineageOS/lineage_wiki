module Jekyll
  module DeviceMaintainers
    def device_maintainers(input)
      ret = []

      input['maintainers'].each do |x|
        if x.is_a? Array
          ret.push(x[0])
        else
          ret.push(x)
        end
      end

      ret
    end
  end
end

Liquid::Template.register_filter(Jekyll::DeviceMaintainers)
