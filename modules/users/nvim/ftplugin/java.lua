local config = {
  cmd = {
   'jdtls'
  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', '.root', 'pom.xml'}),

  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  init_options = {
    bundles = {}
  },
}

require('jdtls').start_or_attach(config)
