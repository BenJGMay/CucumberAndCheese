require 'watir'
browser = Watir:: Browser.new :chrome
browser.goto 'http://puppies.herokuapp.com/'
sleep (5)
browser.close()
