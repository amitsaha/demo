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

  $filename     = 'cloudflared'
  $download_url = 'https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz'

  archive { "/tmp/${filename}.tar.gz":
    source       => $download_url,
    extract      => true,
    extract_path => $cloudflared::config_dir,
    creates      => "${cloudflared::config_dir}/${filename}",
    notify       => Service['cloudflared'],
  }
}
