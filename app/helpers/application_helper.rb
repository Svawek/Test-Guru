module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, depo)
    link = "https://github.com/#{author}/#{depo}"
    "<a href='#{link}' target='_blank'>Проект 'Test Guru'</a>".html_safe
  end
end
