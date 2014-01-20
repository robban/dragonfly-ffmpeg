module EnMasse
  module Dragonfly
    module FFMPEG
      class Extract

        def call(content, args='', opts={})
          Rails.logger.debug("£££££ FFMPEG thumb")
          Rails.logger.debug(opts['seconds'].to_s)
          Rails.logger.debug(opts['geometry'] .to_s)
          ext = "png"
          tempfile = ::Dragonfly::Utils.new_tempfile(ext)
          ::FFMPEG::Movie.new(content.path).screenshot(tempfile.path, seek_time: opts['seconds'], resolution: opts['geometry'] )
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
