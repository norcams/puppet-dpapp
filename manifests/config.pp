#
class dpapp::config(
  $horizon_url = $::dpapp::horizon_url,
  $keystone_url = $::dpapp::keystone_url,
  $admin_pw = $::dpapp::admin_pw,
  $oauth_client_id = $::dpapp::oauth_client_id,
  $oauth_client_secret = $::dpapp::oauth_client_secret,
  $installdir = $::dpapp::installdir,
  $host = $::dpapp::host,
  $port = $::dpapp::port,
  $deployment = $::dpapp::deployment
) {

  file { "${installdir}/production.ini":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/production.ini.erb")
  }

  file { "/usr/local/sbin/bootstrap_dpapp.sh":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/bootstrap.sh.erb")
  }

  file { $installdir:
    ensure => directory,
    owner => 'dpapp',
    group => 'dpapp'
  }

  user { 'dpapp':
    home => $installdir,
  }
}
