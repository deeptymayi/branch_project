require_relative '../../lib/pages/abstract_page'
require_relative '../../lib/pages/live_view'
require 'page-object'


class HomePage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def navigateToLiveView
    #### Navigate to Live View Page
    @@driver.find_element(:tag_name => "body").text.include?("Summary")
    @@driver.find_element(:tag_name => "body").text.include?("Installs")
    @@driver.navigate.to('https://dashboard.branch.io/liveview/links')
    sleep 5
    return LiveViewPage.new(@@driver)
  end
end


