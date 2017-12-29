require_relative '../../lib/pages/abstract_page'
require_relative '../../lib/pages/live_view'
require_relative '../../lib/pages/home_page'


class QuickLinksPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def verifyLink
    #### Verify the new link created
    @@driver.find_element(:tag_name => "body").text.include?("All Links loaded")
    @@driver.find_element(:tag_name => "body").text.include? ("https://gilq.app.link/")
    sleep 5
    puts @@driver.title
    return QuickLinksPage.new(@@driver)
  end


  def viewLinkStatsOnContextMenu
    ###### Clicks on the Context Menu and on View Stats to navigate to Link Stats Page
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[1]/button').click
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[2]/div/ul/li[2]/a').click
    sleep 5
    ####### Captures the total number of clicks on the Link Stats Page and displays the number on the console
    totalClicksFirst = @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[3]/div/div[2]/div[2]/div/div/div[1]/div/span/span').text
    puts "Total number of link clicks is displayed as #{totalClicksFirst}"
    ##### Navigates to Quick Links page
    @@driver.navigate.to('https://dashboard.branch.io/quick-links')
    sleep 5
    return QuickLinksPage.new(@@driver)
  end


  def clickLinkAndCheckLinkCount
    ######## Clicks on the new link created waits for the page to load
    # @@driver.find_element(:link_text, 'https://gilq.app.link/QNjCVEhjbJ').click
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[3]/div/div[1]/a').click
    ######## Webdriver waits 120 seconds after the link click for link entry to show up
    sleep 120
    ######## Clicks on the Context Menu and on View Stats to navigate to Link Stats Page
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[1]/button').click
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[2]/div/ul/li[2]/a').click
    puts @@driver.title
    sleep 5
    ####### Captures the total number of clicks on the Link Stats Page after the link was clicked.
    ##### This should display the updated total clicks
    totalClicksSecond = @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[3]/div/div[2]/div[2]/div/div/div[1]/div/span/span').text
    puts "Total number of link clicks is displayed as #{totalClicksSecond}"
    return QuickLinksPage.new(@@driver)
  end


  def quit
    @@driver.quit
  end

end