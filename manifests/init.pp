#
class dpapp(
  $horizon_url,
  $keystone_url,
  $admin_pw,
  $oauth_client_id,
  $oauth_client_secret,
  $dp_domain_name,
  $region,
  $admin_user = 'admin',
  $member_role_name = 'user',
  $default_domain_name = 'default',
  $project_name = 'openstack',
  $installdir = '/opt/dpapp',
  $keystone_cachain = '/etc/pki/tls/cert.pem',
  $host = '0.0.0.0',
  $port = '6543',
  $with_local_user = true,
  $manage_config = true,
  $log_level = 'WARN',
  $reload_templates = 'false',
  $deployment = 'install'
) {

  class { '::dpapp::install': }
  if $manage_config {
    class { '::dpapp::config':
      require => Class['dpapp::install']
    }
  }

}
