require 'spec_helper_acceptance'

describe 'cloudflared::install' do
  let(:manifest) {
    <<-EOS
      class { 'cloudflared': }
    EOS
  }

  it 'apply without errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'apply a second time without changes' do
    @result = apply_manifest(manifest)
    expect(@result.exit_code).to be_zero
  end

  describe 'cloudflared is running' do
    context service('cloudflared') do
      it { is_expected.to be_running }
    end
  end

  describe 'cloudflared DNS server listening' do
    it 'cloudflared should setup a server listening on 5353', :retry => 10, :default_sleep_interval => 30 do
      command = command('nc -z -u localhost 5353')
      expect(command.exit_status).to eq(0)
    end
  end
end
