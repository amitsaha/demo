# cloudflared::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include cloudflared::install
class cloudflared::install {
  file{ $cloudflared::exec_dir:
    ensure => 'directory',
  }

  file { $cloudflared::config_dir:
    ensure => 'directory',
  }

  file { "${cloudflared::config_dir}/${cloudflared::config_file}":
    ensure  => 'file',
    content => template('cloudflared/config.yaml.erb'),
    notify  => Service['cloudflared'],
  }

  $filename = 'https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz'

  archive { $filename:
      path => "/tmp/$filename

    file{ "${cloudflared::exec_dir}/${cloudflared_bin}":
    mode    => '0755',
    require => Wget::Fetch['download cloudflared-exec'],
  }

  file{ "${cloudflared::exec_dir}/${cloudflared::exec_file}":
    ensure  => 'link',
    notify  => Service['cloudflared'],
    target  => "${cloudflared::exec_dir}/${cloudflared_bin}",
    require => Wget::Fetch['download cloudflared-exec'],
  }
}
