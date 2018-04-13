# cloudflared::service
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include cloudflared::service
class cloudflared::service {
  include cloudflared::install

  user { $cloudflared::daemon_user:
    ensure => 'present',
  }

  file { '/etc/systemd/system/cloudflared.service':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('cloudflared/cloudflared.service.erb'),
  }

  exec { 'cloudflared reload systemd daemons':
    command     => 'systemctl daemon-reload',
    path        => ['/usr/bin', '/bin', '/user/sbin'],
    refreshonly => true,
    require     => [ File['/etc/systemd/system/cloudflared.service'], User[$cloudflared::daemon_user]],
  }

  service { 'cloudflared':
    ensure => running,
    enable => true,
  }
}
