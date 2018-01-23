module Jekyll
    module DeviceNormalizer
        def normalize_device_list(devs)
            devs.map { |d| normalize_device(d[1]) }
        end

        def normalize_device(dev)
            norm = {}

            norm['Battery Capacity [mAh]'] = battery_capacity(dev['battery'])

            norm['Max. Cam Resolution [MP]'] = dev['cameras'].map { |i| i['info'].split()[0].to_f }.max

            norm['#CPU Cores'] = dev['cpu_cores'].to_i

            norm['CPU Frequency [GHz]'] = max_cpu_freq(dev['cpu_freq'])

            norm['Min. RAM [GB]'], norm['Max. RAM [GB]'] = minmax_gigs(dev['ram'] || "")

            norm['Min. Storage [GB]'], norm['Max. Storage [GB]'] = minmax_gigs(dev['storage'] || "")

            norm['Screen Size [inch]'] = screen_inch(dev['screen'] || "")

            norm['Current LineageOS Branch'] = dev['current_branch'].to_f

            dev['norm'] = norm
            dev
        end

        def minmax_gigs(s)
            s.scan(/([0-9\/]+) *GB/i).flatten
             .map{ |i| i.split("/") }.flatten
             .map{ |i| i.to_i }
             .minmax
        end

        def max_cpu_freq(s)
            s.scan(/([0-9.]+) *GHz/i).flatten
             .map{ |i| i.to_f }
             .max
        end

        def screen_inch(s)
            s.scan(/([0-9.]+) *in/i).flatten[0].to_f
        end

        def battery_capacity(o)
            if o.kind_of?(Array)
                o.map{ |i| i.map{ |k, v| v['capacity'].to_i }}.flatten.max
            else
                o['capacity'].to_i
            end
        end
    end
end

Liquid::Template.register_filter(Jekyll::DeviceNormalizer)
