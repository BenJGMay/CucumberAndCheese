require 'rspec'
require 'page-object'
require 'data_magic'
require 'require_all'

require_all 'lib'

DataMagic.load('checkout.yml')

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.before do
    @browser = Watir::Browser.new :chrome
  end

  config.after do
    @browser.close
  end
end
