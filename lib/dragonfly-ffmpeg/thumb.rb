require 'streamio-ffmpeg'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Thumb

        def update_url(url_attributes)
          url_attributes.ext = "png"
        end

        def call(content, geometry, videoSec, opts={})
          opts['geometry'] = geometry
          opts['seconds'] = videoSec
          content.process!(:extract, opts)
        end

      end
    end
  end
end