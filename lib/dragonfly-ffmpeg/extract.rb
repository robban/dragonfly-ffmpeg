module EnMasse
  module Dragonfly
    module FFMPEG
      class Extract

        def call(content, args='', opts={})
          ext = "png"
          tempfile = ::Dragonfly::Utils.new_tempfile(ext)
          ::FFMPEG::Movie.new(content.path).screenshot(tempfile.path, seek_time: opts['seconds'], resolution: opts['geometry'])
          content.update(tempfile)
          content.meta['format'] = ext
          content.ext = ext
        end

        def update_url(attrs, args='', opts={})
          format = 'png'
          attrs.ext = format if format
        end

      end
    end
  end
end
