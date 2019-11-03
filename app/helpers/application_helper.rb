module ApplicationHelper
  def page_title
    title = 'Fakebook'
    title = @page_title + '-' + title if @page_title
    title
  end

  def user_name
    current_user.last_name + ' ' + current_user.first_name
  end

  def image_set(target)
    target.image? ? target.image.url : '/assets/default.png'
  end
end
