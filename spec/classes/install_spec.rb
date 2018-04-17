require 'spec_helper'

describe 'cloudflared::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include cloudflared' }
      it { is_expected.to compile }

      it { is_expected.to contain_archive('/tmp/cloudflared.tar.gz')
        .with(
          :source => 'https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz',
        )
      }

    end
  end
end
