require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "MyImdbSpec" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://myimdb.herokuapp.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_my_imdb_spec" do
    @driver.get(@base_url + "/movies")
    @driver.find_element(:id, "movie_title").clear
    @driver.find_element(:id, "movie_title").send_keys "Toy Story 2"
    @driver.find_element(:name, "commit").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "role_actor_id")).select_by(:text, "Tom Hanks")
    @driver.find_element(:name, "commit").click
  end
  
  def element_present?(how, what)
    ${receiver}.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    ${receiver}.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = ${receiver}.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
