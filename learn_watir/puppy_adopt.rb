require 'watir'
browser = Watir::Browser.new :chrome
browser.goto("http://puppies.herokuapp.com/")
browser.button(value: 'View Details').click
browser.button(value: 'Adopt Me!').click
browser.button(value: 'Complete the Adoption').click
browser.text_field(:id => 'order_name').set('Test User')
browser.textarea(:id => 'order_address').set('60 City Road EC1Y London')
browser.text_field(:id => 'order_email').set('testmail@test.com')
browser.select_list(:name => 'order[pay_type]').select('Credit card')
browser.button(value: 'Place Order').click
fail 'Browser text did not match expected value' unless browser.text.include? 'Thank you for adopting a puppy!'
browser.close
