guard 'rspec', :version => 2, :cli => "--format Fuubar --color --drb --drb-port 9089" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard 'spork', :wait => 60, :cucumber => false, :rspec_env => { 'RAILS_ENV' => 'test' }, :rspec_port => 9089 do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('spec/spec_helper.rb')
end
