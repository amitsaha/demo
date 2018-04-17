require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'rspec/retry'

run_puppet_install_helper

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      copy_module_to(host, :source => proj_root, :module_name => 'cloudflared')
      on host, puppet('module install puppetlabs-stdlib'), :acceptable_exit_codes => [0]
      on host, puppet('module install puppet-archive'), :acceptable_exit_codes => [0]
    end
  end

  # rspec-retry
  c.verbose_retry = true
  c.display_try_failure_messages = true
end
