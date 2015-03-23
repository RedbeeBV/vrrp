require 'spec_helper'

describe 'vrrp' do
  it { should contain_package('keepalived').with_ensure('installed') }
end
