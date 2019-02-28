require 'rspec'
require 'page-object'
require 'data_magic'
require 'faker'
require 'require_all'

require_all 'lib'

World(PageObject::PageFactory)
