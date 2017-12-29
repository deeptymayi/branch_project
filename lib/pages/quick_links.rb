require_relative '../../lib/pages/abstract_page'
require_relative '../../lib/pages/live_view'
require_relative '../../lib/pages/home_page'
require_relative '../../lib/pages/link_stats'
require 'expect'


class QuickLinksPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  def verifyLink
    @@driver.find_element(:tag_name => "body").text.include?("All Links loaded")
    @@driver.find_element(:tag_name => "body").text.include? ("https://gilq.app.link/")
    # @@driver.find_element(:link_text, 'https://gilq.app.link/QNjCVEhjbJ').click
    sleep 5
    puts @@driver.title

    return QuickLinksPage.new(@@driver)
  end


  def viewLinkStatsOnContextMenu
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[1]/button').click
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[2]/div/ul/li[2]/a').click
    puts @@driver.title
    sleep 5
    totalClicksFirst = @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[3]/div/div[2]/div[2]/div/div/div[1]/div/span/span').text
    puts "Total number of link clicks is displayed as #{totalClicksFirst}"
    @@driver.navigate.to('https://dashboard.branch.io/quick-links')
    sleep 5
    return QuickLinksPage.new(@@driver)
  end

  def clickLinkAndCheckLinkCount
    @@driver.find_element(:link_text, 'https://gilq.app.link/QNjCVEhjbJ').click
    sleep 60
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[1]/button').click
    @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[4]/div/div/div[1]/table/tbody/tr[1]/td[8]/div/div[2]/div/ul/li[2]/a').click
    puts @@driver.title
    sleep 5
    totalClicksSecond = @@driver.find_element(:xpath, '/html/body/div[1]/div/div/div[2]/div[2]/div/div[3]/div/div[2]/div[2]/div/div/div[1]/div/span/span').text
    puts "Total number of link clicks is displayed as #{totalClicksSecond}"
    return QuickLinksPage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

end