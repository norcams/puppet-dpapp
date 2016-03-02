#
class dpapp(
  $horizon_url,
  $keystone_url,
  $admin_pw,
  $oauth_client_id,
  $oauth_client_secret,
  $installdir = '/opt/dpapp',
  $host = '0.0.0.0',
  $port = '6543',
  $manage_config = true,
  $deployment = 'install'
) {

  class { '::dpapp::install': }
  if $manage_config {
    class { '::dpapp::config':
      require => Class['dpapp::install']
    }
  }

}
