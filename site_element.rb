require "headless"
require "open-uri"
require "selenium-webdriver"
require "chunky_png"

class SiteElement

  def initialize(url)
    @driver=Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize
    @driver.navigate.to url
	return @driver
  end

  def oxygen_periodic_table()
    oxygen = @driver.find_element(:title, "Oxygen")
	oxygen.click
  end
  
  def featured_article()
     return @driver.find_element(:title, "This is a featured article. Click here for more information.")
  end
  
  def verify_external_links()
  expected_status = ["200", "OK"]
  
  elements = driver.find_elements(:class, "external text")
  
  elements.size.times do |i|
  link = driver.find_elements(:class, "external text")[i].attribute("href")
  complete_url = base_url + link
  
  io = open(complete_url)
  link_status = io.status

  unless expected_status == link_status
  puts "Link is broken"
  end
  
  end
  end
  
 
 def references_pdf_count()
 ByXpath = '//span[@class="reference-text"]' && '//span.text()=="PDF"'
 elements = @driver.find_elements(:xpath, ByXpath) 
 pdf_count = elements.size
 puts "References pdf count is " + pdf_count
 end
 
 
 def take_screenshot_properties_box()
 headless = Headless.new
 headless.start
 @driver.save_screenshot("screenshot.png")

 rhand_prop_box= driver.find_element(:class, "infobox")
 
 image = ChunkyPNG::Image.from_file("screenshot.png")

 image.crop!(rhand_prop_box.location.x + 1, rhand_prop_box.location.y + 1, rhand_prop_box.size.width, rhand_prop_box.size.height)
 image.save("right_hand_properties_box.png")

 headless.destroy
 end
 

  def close_browser()
    @driver.quit
  end
  
  end