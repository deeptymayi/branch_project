require 'rspec'
require 'selenium-webdriver'
require_relative '../lib/pages/home_page'

describe 'test new branch link' do

  app = nil

  before(:each) do
    ### Open a new firefox browser instance
    app = AbstractPage.new(Selenium::WebDriver.for :firefox)
  end

  after(:each) do
    app.quit
  end


  it 'to see your newly created link on branch dashboard' do
    app.navigateToDashboard.navigateToLiveView.clickOnLink.verifyLink.viewLinkStatsOnContextMenu.clickLinkAndCheckLinkCount
    puts app
  end
 end
