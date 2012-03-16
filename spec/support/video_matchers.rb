#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
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

RSpec::Matchers.define :have_video_codec do |v_codec|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.video_codec(given) == v_codec.to_s
  end
  
  failure_message_for_should do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected codec #{v_codec}, but got #{analyser.video_codec(given)}"
  end
  
  failure_message_for_should_not do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected codec to not be #{v_codec}, but got #{analyser.video_codec(given)}"
  end
end

RSpec::Matchers.define :have_resolution do |resolution|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.resolution(given) == resolution.to_s
  end
end

RSpec::Matchers.define :have_frame_rate do |frame_rate|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.frame_rate(given) == frame_rate
  end
  
  failure_message_for_should do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected frame_rate #{frame_rate}, but got #{analyser.frame_rate(given)}"
  end
  
  failure_message_for_should_not do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected frame_rate to not be #{frame_rate}, but got #{analyser.frame_rate(given)}"
  end
end

RSpec::Matchers.define :have_bitrate do |bitrate|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.bitrate(given) == bitrate
  end
  
  failure_message_for_should do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected bitrate #{bitrate}, but got #{analyser.bitrate(given)}"
  end
  
  failure_message_for_should_not do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected bitrate to not be #{bitrate}, but got #{analyser.bitrate(given)}"
  end
end

RSpec::Matchers.define :have_audio_bitrate do |bitrate|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.audio_bitrate(given) == bitrate
  end
  
  failure_message_for_should do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected audio bitrate #{bitrate}, but got #{analyser.audio_bitrate(given)}"
  end
  
  failure_message_for_should_not do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected audio bitrate to not be #{bitrate}, but got #{analyser.audio_bitrate(given)}"
  end
end

RSpec::Matchers.define :have_audio_codec do |audio_codec|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.audio_codec(given) == audio_codec
  end
  
  failure_message_for_should do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected audio_codec #{audio_codec}, but got #{analyser.audio_codec(given)}"
  end
  
  failure_message_for_should_not do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    "Expected audio_codec to not be #{audio_codec}, but got #{analyser.audio_codec(given)}"
  end
end

RSpec::Matchers.define :have_audio_channels do |audio_channels|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.audio_channels(given) == audio_channels
  end
end

RSpec::Matchers.define :have_audio_sample_rate do |audio_sample_rate|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.audio_sample_rate(given) == audio_sample_rate
  end
end

RSpec::Matchers.define :have_file_extension do |file_extension|
  match do |given|
    File.extname(given.path) == file_extension
  end
end

