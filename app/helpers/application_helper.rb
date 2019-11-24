module ApplicationHelper
  def page_title
    title = 'Postpit'
    title = @page_title + '-' + title if @page_title
    title
  end

  def user_name
    current_user.last_name + ' ' + current_user.first_name
  end

  def image_set(target)
    target.image? ? target.image.url : '/assets/default.png'
  end

  def choose_edit_path
    controller_name == 'accounts' ?
        edit_account_path(current_user) : edit_admin_user_path(@user)
  end

  def choose_delete_path
    controller_name == 'accounts' ?
      account_path(current_user) : admin_user_path(@user)
  end
end
