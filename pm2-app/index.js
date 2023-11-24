'use strict';

const chokidar = require('chokidar');
const fs = require('fs');

var counter = 0
// Initialize a watcher with a glob pattern
const watcher = chokidar.watch('../', {
    ignored: ['../su_monitor', '../custom-metrics', '../.git'],
    persistent: true,
    // followSymlinks: false,
    // useFsEvents: false,
    // usePolling: false,
});

watcher
  .on('add', warning_handler)
  .on('change', warning_handler)
  .on('unlink', warning_handler);

function warning_handler(path) {
  console.log(path)
    fs.writeFileSync('../custom-metrics/fileChanged.prom', 'fileChanged{path="' + path + '"} ' + counter + "\n")
    ++counter
}