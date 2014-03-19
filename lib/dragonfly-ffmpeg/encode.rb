module EnMasse
  module Dragonfly
    module FFMPEG
      class Encode

        def update_url(attrs, format, args="")
          attrs.ext = format.to_s
        end

        def call(content, format, args="")
          encoder = Encoder.new
          encoder.encode(content, format)
        end

      end
    end
  end
end
