#
class dpapp::config(
  $horizon_url = $::dpapp::horizon_url,
  $keystone_url = $::dpapp::keystone_url,
  $admin_pw = $::dpapp::admin_pw,
  $oauth_client_id = $::dpapp::oauth_client_id,
  $oauth_client_secret = $::dpapp::oauth_client_secret,
  $dp_domain_name = $::dpapp::dp_domain_name,
  $admin_user = $::dpapp::admin_user,
  $member_role_name = $::dpapp::member_role_name,
  $default_domain_name = $::dpapp::default_domain_name,
  $project_name = $::dpapp::project_name,
  $installdir = $::dpapp::installdir,
  $host = $::dpapp::host,
  $port = $::dpapp::port,
  $region = $::dpapp::region,
  $with_local_user = $::dpapp::with_local_user,
  $keystone_cachain = $::dpapp::keystone_cachain,
  $log_level = $::dpapp::log_level,
  $reload_templates = $::dpapp::reload_templates,
  $deployment = $::dpapp::deployment,
  $mq_host = $::dpapp::mq_host,
  $mq_vhost = $::dpapp::mq_vhost,
  $mq_username = $::dpapp::mq_username,
  $mq_password = $::dpapp::mq_password,
) {

  file { "${installdir}/production.ini":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/production.ini.erb")
  }

  file { "${installdir}/pyramid.wsgi":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/pyramid.wsgi.erb")
  }

  file { "/usr/local/sbin/dpapp_develop.sh":
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
