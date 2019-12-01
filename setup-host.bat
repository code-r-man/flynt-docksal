@echo off
rem Copy the ACF archive to project. "%CD%" is the current dir.
echo "C:\Users\%USERNAME%\Dropbox\ACF-pro %CD%"
copy C:\Users\%USERNAME%\Dropbox\ACF-pro %CD%

rem Install host global dependencies
echo "install -g rimraf npm-run-all check-node-version"
npm install -g rimraf npm-run-all check-node-version
