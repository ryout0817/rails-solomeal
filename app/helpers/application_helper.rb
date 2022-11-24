module ApplicationHelper
  BASE_TITLE = "ひとり飯".freeze

  def full_title(title_name)
    title_name.blank? ? BASE_TITLE : "#{title_name} | #{BASE_TITLE}"
  end
end
