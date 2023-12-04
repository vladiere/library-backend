// scripts/copyFiles.ts
import ncp from 'ncp';
import path from 'path';

// Specify the source and destination directories to copy
const sourceDir = path.join(__dirname, '../src/public'); // adjust the path based on your project structure
const destinationDir = path.join(__dirname, '../dist/src/public');

// Options for the copy operation
const copyOptions: ncp.Options = {
  clobber: false, // do not overwrite existing files
  stopOnErr: true, // stop on error
};

ncp(sourceDir, destinationDir, copyOptions, (err) => {
  if (err) {
    console.error('Error copying files:', err);
  } else {
    console.log('Files copied successfully!');
  }
});

