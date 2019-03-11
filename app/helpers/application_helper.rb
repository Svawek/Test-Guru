module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, depo)
    link_to 'Проект "Test Guru"', "https://github.com/#{author}/#{depo}", :target => "_blank"
  end
end
