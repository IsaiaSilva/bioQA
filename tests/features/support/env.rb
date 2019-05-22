$:.unshift("#{File.dirname(__FILE__)}/../../lib/")

require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'faker'
require 'site_prism'
require 'rspec'
require 'pry'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(PageObjects)

BROWSERS = ENV['BROWSERS']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

CONFIG = YAML.load_file(File.dirname(__FILE__) +
"/data/#{ENVIRONMENT_TYPE}.yml")
#puts ENVIRONMENT_TYPE

Capybara.register_driver :selenium do |app|

if BROWSERS.eql?('chrome')
  Capybara::Selenium::Driver.new(app,browser: :chrome,
    #args: ["--window-size=1366,768", "--start-maximized"]
    desired_capabilities: {
        "chromeOptions" => {
          'args' => %w{ window-size=1366,768, --start-maximized }    
       }
      }
    )

elsif BROWSERS.eql?('chrome_headless')
  Capybara::Selenium::Driver.new(
    app, browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
          'chromeOptions' => { 'args' => ['headless', '--disable-gpu',
                                      '--disable-infobars',
                                      'binary: "C:\projetos\desenvolvimento\tools\drivers\chromedriver_2.43\chromedriver.exe"',
                                      'window-size=1366,768'] }
    )
  )
elsif BROWSERS.eql?('firefox')
  Capybara::Selenium::Driver.new(
    app,
    :browser => :firefox,
    :marionette => true
    #:url => '127.0.0.1:4444', 
    #:driver_path => 'C:/Program Files/Mozilla Firefox/firefox.exe'
  )

elsif BROWSERS.eql?('firefox_headless')
  browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: browser_options
    )
  elsif BROWSERS.eql?('edge')
    Capybara::Selenium::Driver.new(app,browser: :edge)
  
  elsif BROWSERS.eql?('edge_headless')
    browser_options = Selenium::WebDriver::MicrosoftEdge::Options.new(args: ['--headless'])
      Capybara::Selenium::Driver.new(
        app,
        browser: :edge,
        options: browser_options
      )
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_max_wait_time = 10
  config.app_host = CONFIG['url_padrao']
end

# Keeps the tests independent by closing the browser and opening for each test scenario
After do  
  Capybara.current_session.driver.quit  
end