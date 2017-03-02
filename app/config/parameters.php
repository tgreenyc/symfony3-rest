<?php

    // If it's running on PCF, then override parameters.yml settings for DB.
    if (getenv('VCAP_SERVICES')) {
      $service_blob = json_decode($_ENV['VCAP_SERVICES'], true);
      $mysql_services = array();
      foreach($service_blob as $service_provider => $service_list) {
          // looks for 'cleardb' or 'p-mysql' service
          if ($service_provider === 'cleardb' || $service_provider === 'p-mysql') {
              foreach($service_list as $mysql_service) {
                  $mysql_services[] = $mysql_service;
              }
              continue;
          }
          foreach ($service_list as $some_service) {
              // looks for tags of 'mysql'
              if (in_array('mysql', $some_service['tags'], true)) {
                  $mysql_services[] = $some_service;
                  continue;
              }
              // look for a service where the name includes 'mysql'
              if (strpos($some_service['name'], 'mysql') !== false) {
                  $mysql_services[] = $some_service;
              }
          }
      }
      $db = $mysql_services[0]['credentials'];
      $container->setParameter('database_host', $db['hostname']);
      $container->setParameter('database_name', $db['name']);
      $container->setParameter('database_user', $db['username']);
      $container->setParameter('database_password', $db['password']);
    }

?>
