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

require 'spec_helper'

describe EnMasse::Dragonfly::FFMPEG::Encoder do
  
  subject do
    encoder = EnMasse::Dragonfly::FFMPEG::Encoder.new
    encoder.output_directory = TMP_DIR
    encoder
  end
  
  let(:raw_video) { Dragonfly::TempObject.new(File.new(SAMPLES_DIR + '/test-movie.mov')) }
  
  describe "encode with default mp4 profile" do
    let(:video) { subject.encode(raw_video, :mp4).first }
    
    it "should have the h264 video codec" do
      video.should have_video_codec(:h264)
    end
    
    it "should have a mp4 file extension" do
      video.should have_file_extension('.mp4')
    end
  end
  
  describe "encode with default mp4 profile" do
    let(:video) { subject.encode(raw_video, :ogv).first }

    it "should have the theora video codec" do
      video.should have_video_codec(:theora)
    end
    
    it "should have the ogv file extension" do
      video.should have_file_extension('.ogv')
    end
  end
  
  describe "encode with default webm profile" do
    let(:video) { subject.encode(raw_video, :webm).first }
    
    it "should have the libvpx video codec" do
      video.should have_video_codec(:libvpx)
    end
    
    it "should have the webm file extension" do
      video.should have_file_extension('.webm')
    end
  end
  
  describe "encode with an inline defined encoding profile" do
    let(:profile) do
      EnMasse::Dragonfly::FFMPEG::Encoder::Profile.new(:webm_720p,
        :video_codec => "libvpx",
        :resolution => "1280x720",
        :frame_rate => 29.97,
        :video_bitrate => 3072,
        :audio_codec => "libvorbis",
        :audio_channels => 2,
        :audio_sample_rate => 48000,
        :custom => "-f webm"
      )
    end
    
    let(:video) { subject.encode(raw_video, :webm, profile).first }
    
    it "should have the specified video codec" do
      video.should have_video_codec(profile.encoding_options[:video_codec])
    end
    
    it "should have the specified resolution" do
      video.should have_resolution(profile.encoding_options[:resolution])
    end
    
    it "should have the specified frame rate" do
      video.should have_frame_rate(profile.encoding_options[:frame_rate])
    end
    
    it "should have the specified bitrate" do
      video.should have_bitrate(profile.encoding_options[:video_bitrate])
    end
    
    it "should have the specified audio codec" do
      video.should have_audio_codec(profile.encoding_options[:audio_codec])
    end
    
    it "should have the specified number of audio channels" do
      video.should have_audio_channels(profile.encoding_options[:audio_channels])
    end
    
    it "should have the specified audio sample rate" do
      video.should have_audio_sample_rate(profile.encoding_options[:audio_sample_rate])
    end
  end
  
  it "should throw UnsupportedFormat if the format specified is not defined" do
    lambda {
      subject.encode(raw_video, :lol264, :html5)
    }.should raise_error(EnMasse::Dragonfly::FFMPEG::UnsupportedFormat)
  end
  
  it "should throw UnknownEncoderProfile if the encoding profile is not defined" do
    lambda {
      subject.encode(raw_video, :webm, :a_fake_profile)
    }.should raise_error(EnMasse::Dragonfly::FFMPEG::UnknownEncoderProfile)
  end

end
