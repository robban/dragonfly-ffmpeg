module EnMasse
  module Dragonfly
    module FFMPEG
      class Thumb

        def call(content, opts={})
          ext = "png"
          tempfile = Utils.new_tempfile(ext)
          FFMPEG::Movie.new(content.path).screenshot(tempfile.path, seek_time: 5, resolution: '320x240')
          update(tempfile)
          content.meta['format'] = ext
          content.ext = ext
        end

      end
    end
  end
end