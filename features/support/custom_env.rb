# See http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
Devise.stretches = 1

ej = ENV['CAPYBARA_JAVASCRIPT_DRIVER']
Capybara.javascript_driver = ej.to_sym if ej

case
when :poltergeist == Capybara.javascript_driver
# TODO: Maybe do more here.
# You must have installed PhantomJS:
# see htps://github.com/jonleighton/poltergeist
  require 'capybara/poltergeist'

when :selenium == Capybara.javascript_driver
  fb = ENV['FIREFOX_BINARY_PATH']
  Selenium::WebDriver::Firefox::Binary.path = fb if fb

when ([:webkit, :webkit_debug].include? Capybara.javascript_driver)
  require 'headless'
  Headless.new.start
end

