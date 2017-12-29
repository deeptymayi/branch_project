require_relative '../../lib/pages/abstract_page'
require_relative '../../lib/pages/home_page'
require_relative '../../lib/pages/quick_links'

class LiveViewPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def clickOnLink
     #### Validate text on Live view page
     @@driver.find_element(:tag_name => "body").text.include?("All Links loaded")
     @@driver.find_element(:tag_name => "body").text.include?("Automation")
     #### Navigate to Live View Clicks tab
     @@driver.navigate.to('https://dashboard.branch.io/liveview/clicks')
     sleep 5
     ##### Validate text on Clicks page
     @@driver.find_element(:tag_name => "body").text.include?("All Clicks loaded")
     ##### Navigate to Quick Links page
     @@driver.navigate.to('https://dashboard.branch.io/quick-links')
     sleep 5
     return QuickLinksPage.new(@@driver)
  end
end