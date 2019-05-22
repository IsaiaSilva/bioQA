
require 'fileutils'
# metodo para tira screenshot e imbutir no relatorio html
module Helper
  def take_screenshot(file_name, result)
    timer_path = Time.now.strftime('%F').to_s
    file_path = "results/screenshots/test_#{result}/run_#{timer_path}"
    screenshot = "#{file_path}/#{file_name}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Click here')
  end
end 

module JavascriptDriver
  def scrool_to(element)
      script = <<-JS
        arguments[0].scrollIntoView(true);
      JS

      Capybara.current_session.driver.browser.execute_script(script, element.native)
  end

  def scroll_down_page

    page.execute_script('window.scrollTo(0,document.body.scrollHeight);')
   end
   
end
  
  