require 'rspec'
require 'selenium-webdriver'
require_relative '../lib/pages/home_page'

describe 'test new branch link' do

  app = nil

  before(:each) do
    app = AbstractPage.new(Selenium::WebDriver.for :firefox)
    # app = AbstractPage.new(Selenium::WebDriver.for [:firefox,:android_phone])

    #@driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_phone, :orientation => :landscape)

  end

  after(:each) do
    # app.quit
  end


  it 'to see your newly created link on branch dashboard' do
    # linkConfirmation = app.navigateToDashboard.navigateToLiveView.clickOnLink.verifyLink
    app.navigateToDashboard.navigateToLiveView.clickOnLink.verifyLink.viewLinkStatsOnContextMenu.clickLinkAndCheckLinkCount
    puts app
    #expect (linkConfirmation.title).to be == 'Quick Links'
  end
 end
