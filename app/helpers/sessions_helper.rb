module SessionsHelper
  def flash_helper(message)
    content_tag :p, flash[message], class: "flash #{message}" if flash[message]
  end
end
