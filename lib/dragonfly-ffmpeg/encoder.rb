#
# Author:: Jamie Winsor (<jamie@enmasse.com>)
# Copyright:: 2011, En Masse Entertainment, Inc
# License:: Apache License, Version 2.0
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'streamio-ffmpeg'
require 'pathname'
require 'dragonfly-ffmpeg/encoder/profile'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Encoder
        
        include ::Dragonfly::Configurable
        
        configurable_attr :encoder_profiles, {
          :mp4 => [
            Profile.new(:html5,
              :video_codec => "libx264",
              :resolution => "1280x720",
              :frame_rate => 29.97,
              :video_bitrate => 3072,
              :audio_codec => "libfaac",
              :audio_channels => 2,
              :audio_sample_rate => 48000,
              :video_preset => "hq"
            )
          ],
          :ogv => [
            Profile.new(:html5,
              :video_codec => "libtheora",
              :resolution => "1280x720",
              :frame_rate => 29.97,
              :video_bitrate => 3072,
              :audio_codec => "libvorbis",
              :audio_channels => 2,
              :audio_sample_rate => 48000
            )
          ],
          :webm => [
            Profile.new(:html5,
              :video_codec => "libvpx",
              :resolution => "1280x720",
              :frame_rate => 29.97,
              :video_bitrate => 3072,
              :audio_codec => "libvorbis",
              :audio_channels => 2,
              :audio_sample_rate => 48000,
              :custom => "-f webm"
            )
          ]
        }
        
        configurable_attr :output_directory, '/tmp'
        
        def encode(temp_object, format, profile = :html5, options = {})
          format = format.to_sym
          raise UnsupportedFormat, "Format not supported - #{format}" unless supported_format?(format)
          unless profile.is_a?(Profile)
            raise UnknownEncoderProfile unless profile_defined?(format, profile.to_sym)
            profile = get_profile(format, profile.to_sym)
          end
          
          options.merge!(profile.encoding_options)
          
          origin = ::FFMPEG::Movie.new(temp_object.path)
          tempfile = new_tempfile(format)
          origin.transcode(tempfile.path, options)
          [tempfile, :format => format, :ext => format.to_s]
        end
                
        private
        
        def new_tempfile(ext = nil)
          tempfile = ext ? Tempfile.new(["dragonfly-ffmpeg", ".#{ext}"]) : Tempfile.new("dragonfly-ffmpeg")
          tempfile.binmode
          tempfile.close
          tempfile
        end
        
        def profiles(format)
          encoder_profiles[format]
        end
        
        def get_profile(format, profile_name)
          result = profiles(format).select { |profile| profile.name == profile_name }
          result.first
        end
        
        def supported_format?(format)
          encoder_profiles.has_key?(format)
        end
        
        def profile_defined?(format, profile_name)
          return false if profiles(format).nil?
          
          encoder_profiles[format].any? { |profile| profile.name == profile_name }
        end
        
      end
    end
  end
end
