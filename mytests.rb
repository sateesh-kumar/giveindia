require_relative 'site_element.rb'
require 'test/unit'
require 'selenium-webdriver'
@browser
@actual_value
@expected_value

class MyTests < Test::Unit::TestCase

# Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
		@browser=SiteElement.new("https://en.wikipedia.org/wiki/Selenium")
  end

  def test_A
  
  #Verify that external links in the external links section works
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  wait.until {@browser.verify_external_links}


  
   #verify that oxygen is a featured article
   wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
   wait.until {@browser.oxygen_periodic_table}
  
   if (@browser.featured_article) then
   puts "Oxygen is a featured article"
   
   
   #Take a screen shot of right hand properties box
   wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
   wait.until {@browser.take_screenshot_properties_box}
   
   
   #Count the number of pdf links in references
   wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
   wait.until {@browser.references_pdf_count}
   
def teardown
  @browser.close_browser
  end
end