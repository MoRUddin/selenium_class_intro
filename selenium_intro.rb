require "selenium-webdriver"

name = "Mo"

chrome_driver = Selenium::WebDriver.for :chrome

chrome_driver.get("http://toolsqa.com/automation-practice-form/")

chrome_driver.find_element(:name, "firstname").displayed?

chrome_driver.find_element(:name, "firstname").send_key("Hello #{name}")

sleep 2
