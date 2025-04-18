const pkgJson= require('./package.json');
console.log('name: ', pkgJson.name);

module.exports = {
  apps: [
    {
      name: 'hdok',
      script: 'dist/main.js',
      instances: 1,
      exec_mode: 'fork', // or 'cluster' if you want clustering
      watch: false,
      env: {
        NODE_ENV: 'production',
      },
    },
  ],
};
