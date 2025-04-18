const { name } = require('./package.json');

/**
 * You can use either env_file to read variables from,
 * declare env variables in this file itself or do both.
 * PM2 will load all variables from env_file and override
 * any of them with keys from env.
 */

module.exports = {
  apps: [
    {
      name,
      script: 'dist/index.js',
      watch: true,
			env_file: '.env',
      env: {
        NODE_ENV: 'production',
      },
    },
  ],
};
