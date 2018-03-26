require "selenium-webdriver"

class SeleniumQATools
  PRACTICE_FORM_URL = "http://toolsqa.com/automation-practice-form/"
  FIRST_NAME = "firstname"
  LAST_NAME = "lastname"
  SEX = "sex"
  YEARS_EXPERIENCE = "exp"
  DATE = "datepicker"
  PROFESSION = "profession"
  PROFILE_PHOTO = "photo"
  AUTOMATION_TOOL = "tool"
  CONTINENTS = "continents"
  BUTTON = "submit"
  COMMAND = "selenium_commands"

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
    visit_practice_form
  end

  def visit_practice_form
    @chrome_driver.get(PRACTICE_FORM_URL)
  end

  def input_first_name(text)
    @chrome_driver.find_element(:name, FIRST_NAME).send_key(text)
  end

  def get_first_name_text
    puts "Name: " + @chrome_driver.find_element(:name, FIRST_NAME)["value"]
  end

  def input_last_name(text)
    @chrome_driver.find_element(:name, LAST_NAME).send_key(text)
  end

  def get_last_name_text
    puts "Surname: " + @chrome_driver.find_element(:name, LAST_NAME)["value"]
  end

  def input_male
    @chrome_driver.find_element(:id, "#{SEX}-0").click
  end

  def get_male_selected
    if @chrome_driver.find_element(:id, "#{SEX}-0").selected?
      puts "Sex: " + @chrome_driver.find_element(:id, "#{SEX}-0")["value"]
    else
      puts "Not male"
    end
  end

  def input_female
    @chrome_driver.find_element(:id, "#{SEX}-1").click
  end

  def get_female_selected
    if @chrome_driver.find_element(:id, "#{SEX}-1").selected?
      puts "Sex: " + @chrome_driver.find_element(:id, "#{SEX}-1")["value"]
    else
      puts "Not female"
    end
  end

  def input_years_experience(years)
    @chrome_driver.find_element(:id, "#{YEARS_EXPERIENCE}-#{years-1}").click
  end

  def get_years_experience(years)
    if @chrome_driver.find_element(:id, "#{YEARS_EXPERIENCE}-#{years-1}").selected?
      puts "Years Exp: " + @chrome_driver.find_element(:id, "#{YEARS_EXPERIENCE}-#{years-1}")["value"]
    else
      puts "Not #{years} years experience"
    end
  end

  def input_date(date)
    @chrome_driver.find_element(:id, DATE).send_key(date)
  end

  def get_date
    puts "Date: " + @chrome_driver.find_element(:id, DATE)["value"]
  end

  def input_profession_manual
    @chrome_driver.find_element(:id, "#{PROFESSION}-0").click
  end

  def get_selected_manual
    if @chrome_driver.find_element(:id, "#{PROFESSION}-0").selected?
      puts "Profession: " + @chrome_driver.find_element(:id, "#{PROFESSION}-0")["value"]
    else
      puts "Not manual tester"
    end
  end

  def input_profession_automated
    @chrome_driver.find_element(:id, "#{PROFESSION}-1").click
  end

  def get_selected_automated
    if @chrome_driver.find_element(:id, "#{PROFESSION}-1").selected?
      puts "Profession: " + @chrome_driver.find_element(:id, "#{PROFESSION}-1")["value"]
    else
      puts "Not automation tester"
    end
  end

  def input_profile_photo(file_path)
    @chrome_driver.find_element(:id, PROFILE_PHOTO).send_key(file_path)
  end

  def input_tools(tools)
    @chrome_driver.find_element(:id, "#{AUTOMATION_TOOL}-#{tools-1}").click
  end

  def get_tools(tools)
    if @chrome_driver.find_element(:id, "#{AUTOMATION_TOOL}-#{tools-1}").selected?
      puts "Automation Tools: " + @chrome_driver.find_element(:id, "#{AUTOMATION_TOOL}-#{tools-1}")["value"]
    else
      puts "Not #{@chrome_driver.find_element(:id, "#{AUTOMATION_TOOL}-#{tools-1}")["value"]}"
    end
  end

  def select_continent(continent)
    @chrome_driver.find_element(:id, "#{CONTINENTS}").find_elements(:tag_name, "option").each do |cont|
      if cont["value"]==continent
        cont.click
      end
    end
  end

  def get_continent
    puts @chrome_driver.find_element(:id, "#{CONTINENTS}")["value"]
  end

  def select_command(selenium_command)
    @chrome_driver.find_element(:id, "#{COMMAND}").find_elements(:tag_name, "option").each do |comm|
      if comm["value"]==selenium_command
        comm.click
      end
    end
  end

  def get_command
    puts @chrome_driver.find_element(:id, "#{COMMAND}")["value"]
  end

  def click_button
    @chrome_driver.find_element(:id, "#{BUTTON}").click
  end

  def button_value
    puts @chrome_driver.find_element(:id, "#{BUTTON}").text
  end
end

x = SeleniumQATools.new
x.input_first_name("Mo")
x.get_first_name_text
x.input_last_name("Uddin")
x.get_last_name_text
x.input_male
x.get_male_selected
x.get_female_selected
x.input_years_experience(3)
for i in (1..7)
  x.get_years_experience(i)
end
x.input_date("26-03-2018")
x.get_date
x.input_profession_automated
x.get_selected_manual
x.get_selected_automated
x.input_profile_photo("/Users/tech-a22/Desktop/eng-6-coursework/sdet/webtesting-frameworks/selenium/intro/my_img.jpg")
x.input_tools(1)
x.input_tools(3)
for i in (1..3)
  x.get_tools(i)
end
x.select_continent("Europe")
x.get_continent
x.select_command("Wait Commands")
x.get_command
x.button_value
x.click_button
sleep 2
