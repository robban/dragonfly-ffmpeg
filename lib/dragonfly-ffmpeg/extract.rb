module EnMasse
  module Dragonfly
    module FFMPEG
      class Extract

        def call(content, args='', opts={})
          Rails.logger.debug("£££££ FFMPEG thumb")
          Rails.logger.debug(args['seconds'].to_s)
          Rails.logger.debug(args['geometry'] .to_s)
          ext = "png"
          tempfile = ::Dragonfly::Utils.new_tempfile(ext)
          ::FFMPEG::Movie.new(content.path).screenshot(tempfile.path, seek_time: args['seconds'], resolution: args['geometry'], preserve_aspect_ratio: :width )
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
