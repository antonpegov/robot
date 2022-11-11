# Robot framework playground

## Requirements

Python 3.6 - 3.9 (3.10 not supported)

## Installation

### -> Install robot framework

`pip install robotframework` - install robot framework

`pip install robotframework-ride` - install robot framework test runner

*** if you have Python > 3.9, do not install it, use VSCode plugin to run tests (Robot Framework Language Server)

### -> Install selenium library and webdriver

`pip install robotframework-seleniumlibrary` - install selenium library for browser automation

`pip install webdrivermanager` - install webdriver manager for seleneum

`webdrivermanager firefox chrome` - install firefox and chrome drivers

## Run tests

`robot -d results tests` - run all tests
