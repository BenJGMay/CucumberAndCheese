require 'watir'

Before do |scenario|
  @browser = Watir::Browser.new :chrome
  DataMagic.load_for_scenario(scenario)
end


After do
  @browser.close
end
