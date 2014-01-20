require 'streamio-ffmpeg'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Thumb

        def update_url(url_attributes, geometry, videoSec,  opts={})
          url_attributes.ext = "png"
        end

        def call(content, geometry, videoSec, opts={})
          Rails.logger.debug("£££££ FFMPEG thumb")
          Rails.logger.debug(geometry.to_s)
          Rails.logger.debug(videoSec.to_s)
          opts['geometry'] = geometry
          opts['seconds'] = videoSec
          content.process!(:extract, opts)
        end

      end
    end
  end
end