
require 'watir'

driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :landscape)
browser = Watir::Browser.new driver, :switches => %w[--proxy-server=#{proxy.host}:#{proxy.port}]
browser.goto 'google.com'