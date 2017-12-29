require_relative '../../lib/pages/abstract_page'
require_relative '../../lib/pages/live_view'
require 'page-object'


class HomePage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def navigateToLiveView
    @@driver.find_element(:tag_name => "body").text.include?("Summary")
    @@driver.find_element(:tag_name => "body").text.include?("Installs")
    @@driver.navigate.to('https://dashboard.branch.io/liveview/links')
    sleep 5
    # @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    # begin
    #   @wait.until { @@driver.find_element(:tag_name => "body").text.include?("All Links loaded")}
    # rescue
    #   puts "Failure! text is not present on the page"
    # @@driver.find_element(:tag_name => "body").text.include?("All Links loaded")
    # @@driver.find_element(:tag_name => "body").text.include?("Automation")
    return LiveViewPage.new(@@driver)
  end
end


