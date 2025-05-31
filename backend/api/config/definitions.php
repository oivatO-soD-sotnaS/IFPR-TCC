<?php

use App\Database;

return [
  Database::class => function() {
    return new Database(
      host: "database_container",
      name: "intellecta",
      user: "www_root",
      password:"foraelecriadoParahabitaruminstantequefosseNasvizinhascasdoteucoracao"
    );
  }
];