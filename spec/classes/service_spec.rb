require 'spec_helper'

describe 'cloudflared::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include cloudflared' }
      it { is_expected.to compile }

      it { is_expected.to contain_user('cloudflared')
        .with(
          :ensure => 'present',
        )
      }

      it { is_expected.to contain_service('cloudflared')
        .with(
          :ensure => 'running',
          :enable => true,
        )
      }
    end
  end
end
