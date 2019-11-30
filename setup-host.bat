@echo off
rem Copy the ACF archive to project. "%CD%" is the current dir.
echo "C:\Users\Win10\Dropbox\ACF_pro %CD%"
copy C:\Users\Win10\Dropbox\ACF_pro %CD%

rem Install host global dependencies
echo "npm install -g rimraf"
npm install -g rimraf
echo "npm install -g npm-run-all"
npm install -g npm-run-all
echo "npm install -g check-node-version"
npm install -g check-node-version