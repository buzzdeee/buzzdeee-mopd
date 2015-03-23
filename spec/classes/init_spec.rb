require 'spec_helper'
describe 'mopd' do

  context 'with defaults for all parameters' do
    it { should contain_class('mopd') }
  end
end
