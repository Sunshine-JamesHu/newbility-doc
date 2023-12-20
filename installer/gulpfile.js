const { series, src, dest } = require('gulp');
const del = require('del');
const chmod = require('gulp-chmod');
const child_process = require('child_process');
const fs = require('fs');
const path = require('path');
const JSON5 = require('json5');
const destDir = 'build';
const pkgDir = 'pkg';

function clean(cb) {
  del([destDir, pkgDir, 'publish/app/public', 'publish/app/newbility-doc']);
  cb();
}

function build(cb) {
  child_process.exec('tsc', (error) => {
    cb(error);
  });
}

function copyFile(cb) {
  src('app.config.json').pipe(dest(destDir));
  src('package.json').pipe(dest(destDir));
  cb();
}

function buildPkg(cb) {
  child_process.exec('pkg .', (err) => {
    if (err) {
      cb(err);
    } else {
      src('pkg/newbility-doc').pipe(chmod(755)).pipe(dest('publish/app')); // 可执行文件
      const pkgJson = fs.readFileSync('package.json', { encoding: 'utf-8' });
      const appVersion = { version: '0.0.0' };
      if (pkgJson) {
        appVersion.version = JSON5.parse(pkgJson).version;
      }
      fs.writeFileSync('publish/app/package.json', JSON.stringify(appVersion, null, 2), 'utf-8');

      const configJson = fs.readFileSync('app.config.json', { encoding: 'utf-8' });
      const config = JSON5.parse(configJson);
      if (config.swagger?.enabled) config.swagger.enabled = false;
      if (config.cors?.enable) config.cors.enable = false;
      if (config.cors?.enable) config.cors.enable = false;
      if (config.log?.logLevel) config.log.logLevel = 'info';

      // 对前端文件使用包中的绝对路径
      const dirName = path.basename(__dirname);
      if (config.static?.default?.dir) config.static.default.dir = `/snapshot/${dirName}/public`;
      if (config.static?.imgs?.dir) config.static.imgs.dir = `/snapshot/${dirName}/imgs`;

      fs.writeFileSync('publish/app/app.config.json', JSON.stringify(config, null, 2), 'utf-8');

      cb();
    }
  });
}

exports.default = series(clean, build, copyFile, buildPkg, clean);
