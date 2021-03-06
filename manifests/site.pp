Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ] }

node default {

  class { 'apt':
    always_apt_update => true,
  }

  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup_56
  include tomcat

  include openmrs
  include openmrs::initial_setup
  include mysql_setup::db_setup

}

node 'emr.hum.ht' {

  class { 'apt':
    always_apt_update => true,
  }

  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup_56
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  include mysql_setup::db_setup

  include mirth
  include mirth::channel_setup
  
  include newrelic
  include logging

  include mysql_setup::backup
  include mirebalais_reporting::production_setup
}

node 'bamboo.pih-emr.org' {
  
  class { 'apt':
    always_apt_update => true,
  }

  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup_56
  include tomcat

  include openmrs
  include openmrs::initial_setup
  include mysql_setup::db_setup

  include mirth
  include mirth::channel_setup
  
  include newrelic
}


node 'emrtest.hum.ht', 'humdemo.pih-emr.org' {
  
  class { 'apt':
    always_apt_update => true,
  }

  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup_56
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  include mysql_setup::db_setup

  include mirth
  include mirth::channel_setup
  
  include newrelic
  include logging
}

node 'reporting.hum.ht' {

  class { 'apt':
    always_apt_update => true,
  }

  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup_56
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  include mysql_setup::db_setup

  include mirth
  include mirth::channel_setup
  
  include newrelic
  include logging 
	
  include mirebalais_reporting::reporting_setup 
}



# TODO: do we still use/need this?

node 'emrreplication.hum.ht' inherits default {
  class { 'apt':
    always_apt_update => true,
  }

  include mailx
  include apt_upgrades
  include wget
  include java
  include mysql_setup_56
  include mirth
  include tomcat
  include openmrs
  include ntpdate
  include apache2
  include awstats
  include logging
  include logging::kibana
  include mysql_setup::slave
}
