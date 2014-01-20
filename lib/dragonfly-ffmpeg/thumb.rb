require 'streamio-ffmpeg'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Thumb

        def update_url(url_attributes, geometry, videoSec,  opts={})
          url_attributes.ext = "png"
        end

        def call(content, geometry, videoSec, opts={})
          args['geometry'] = geometry
          args['seconds'] = videoSec
          content.process!(:extract, args, opts)
        end

      end
    end
  end
end