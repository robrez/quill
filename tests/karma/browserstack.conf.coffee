_     = require('underscore')._
base  = require('./all.conf')

browsers =
  'mac-chrome'  : ['OS X', 'Mountain Lion', 'chrome', '29.0']
  'mac-firefox' : ['OS X', 'Mountain Lion', 'firefox', '24.0']
  'mac-safari'  : ['OS X', 'Mountain Lion', 'safari', '6.0']

  'windows-8-chrome'  : ['Windows', '8', 'chrome', '29.0']
  'windows-8-firefox' : ['Windows', '8', 'firefox', '24.0']
  'windows-8-safari'  : ['Windows', '8', 'safari', '5.1']
  'windows-8-ie-10'   : ['Windows', '8', 'ie', '10.0']

  'windows-7-ie-9'    : ['Windows', '7', 'ie', '9.0']
  'windows-7-ie-8'    : ['Windows', '7', 'ie', '8.0']
browserList = []
customLaunchers = _.reduce(browsers, (memo, browser, name) ->
  browserList.push(name)
  [osName, osVersion, browserName, browserVersion] = browser
  memo[name] =
    base: 'BrowserStack'
    browser: browserName
    browser_version: browserVersion
    os: osName
    os_version: osVersion
  return memo
, {})

module.exports = (config) ->
  base.call(this, config)
  config.set(
    browsers: browserList
    customLaunchers: customLaunchers
    reporters: ['dots']
  )
