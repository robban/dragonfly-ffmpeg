require 'streamio-ffmpeg'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Thumb

        def update_url(url_attributes)
          url_attributes.ext = "png"
        end

        def call(content, opts={})
          content.process!(:extract, opts)
        end

      end
    end
  end
end