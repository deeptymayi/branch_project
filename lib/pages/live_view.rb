require_relative '../../lib/pages/abstract_page'
require_relative '../../lib/pages/home_page'
require_relative '../../lib/pages/quick_links'

class LiveViewPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def clickOnLink
     @@driver.find_element(:tag_name => "body").text.include?("All Links loaded")
     @@driver.find_element(:tag_name => "body").text.include?("Automation")
     @@driver.navigate.to('https://dashboard.branch.io/liveview/clicks')
     sleep 5
     @@driver.find_element(:tag_name => "body").text.include?("All Clicks loaded")
     @@driver.navigate.to('https://dashboard.branch.io/quick-links')
     sleep 5
     return QuickLinksPage.new(@@driver)
  end
end