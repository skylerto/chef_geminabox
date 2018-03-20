# Inspec test for recipe chef_geminabox::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe port(9292), :skip do
  it { should be_listening }
end

describe service('geminabox') do
  it { should be_enabled }
end

describe file('/opt/geminabox') do
  it { should be_directory }
end

describe file('/opt/geminabox/config.ru') do
  it { should be_file }
end
