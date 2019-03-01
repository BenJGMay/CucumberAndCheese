require 'spec_helper'

describe "When checking out during an adoption" do
  it "should require a last name" do
    visit HomePage
    navigate_to(CheckoutPage).checkout('name' => '')
    expect(on(CheckoutPage)).to have_error_message "Name can't be blank"
  end
  it "should display thank you message when checkout is complete" do
    visit HomePage
    navigate_all

  end
end
