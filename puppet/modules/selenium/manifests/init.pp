class selenium (
  $full_version = '2.47.1',
  $major_version = '2.47',
) {
  package { ['openjdk-6-jre-headless', 'firefox', 'xvfb']:
    ensure => 'present',
  }

  file { "/opt/selenium":
    ensure => directory,
  }->
  exec { "download-selenium":
    command => "wget -O /opt/selenium/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/$major_version/selenium-server-standalone-$full_version.jar",
    path => '/usr/bin:/usr/sbin',
    creates => "/opt/selenium/selenium-server-standalone.jar",
  }->
  file { "/home/vagrant/.bash_profile":
    source => 'puppet:///modules/selenium/.bash_profile',
    owner => vagrant,
    group => vagrant,
  }
}
