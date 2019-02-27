RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.error.messages.include? message
  end

  failure_message do |page|
    "Expected '#{page.error.messages}' to include '#{message}'"
  end

  failure_message_when_negated do |page|
    "Expected '#{page.error.messages}' to not include '#{message}'"
  end
end
