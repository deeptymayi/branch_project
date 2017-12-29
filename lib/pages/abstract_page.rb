require 'rspec'
require 'selenium-webdriver'
require_relative '../../lib/pages/home_page'

class AbstractPage

  @@driver = nil

  def initialize (driver)
    @@driver = driver
  end

  def navigateToDashboard
    @@driver.navigate.to('http://dashboard.branch.io/login')

    @@driver.find_element(:name, 'email').send_keys('deeptymayi.patel@gmail.com')
    @@driver.find_element(:class, 'button-type-primary').click
    @@driver.find_element(:tag_name => "body").text.include?("Please specify a password.")
    @@driver.find_element(:name, 'password').send_keys('Testing1')
    @@driver.find_element(:class, 'button-type-primary').click
    sleep 5
    return HomePage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def getPageTitle
    return @@driver.title
  end
end