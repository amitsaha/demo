# cloudflared
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include cloudflared
class cloudflared (
  String $daemon_user = 'cloudflared',
  String $config_dir = '/etc/cloudflared',
  String $config_file = 'config.yaml',
  String $exec_dir = '/usr/share/cloudflared',
  String $exec_file = 'cloudflared',
) {
    include cloudflared::service
}
