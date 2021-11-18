module Jekyll
  class VersionGenerator < Generator
    priority :high
    safe true

    def generate(site)
      site.data["version"] = {}
      site.data["version"]["git"] = %x( git describe --always --dirty).strip
      site.data["version"]["build_date"] = %x( date +%s ).strip
    end
  end
end
