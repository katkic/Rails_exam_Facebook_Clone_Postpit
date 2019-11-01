module ApplicationHelper
  def page_title
    title = 'Fakebook'
    title = @page_title + '-' + title if @page_title
    title
  end

  def user_name
    current_user.last_name + ' ' + current_user.first_name
  end

  def choose_user_icon(target, size)
    # ユーザーアカウントおよび、ヘッダーのアイコン
    if controller_name == 'users' && action_name == 'show' ||
       controller_name == 'users' && action_name == 'edit'
      choose_image_tag(target, size)

    elsif controller_name == 'accounts' && action_name == 'show' ||
          controller_name == 'accounts' && action_name == 'edit'
      choose_image_tag(target, size)

    # 投稿一覧および、ヘッダーのアイコン
    elsif controller_name == 'posts' && action_name == 'show' ||
          controller_name == 'posts' && action_name == 'edit'
      choose_image_tag(target, size)

    # 新規投稿画面および、ヘッダーのアイコン
    elsif action_name == 'new' || action_name == 'confirm'
      choose_image_tag(current_user, size)

    # 投稿者および、ヘッダーのアイコン
    elsif action_name == 'index'
      case size
      when 30
        choose_image_tag(target, size)
      when 50
        choose_image_tag(target, size)
      end
    end
  end

  def choose_image_tag(target, size)
    img_alt = 'ユーザーアイコン'
    css_class_name = "user-icon cover#{size}"
    default_img_path = '/assets/default.png'

    if target.image?
      image_tag target.image.url, alt: img_alt, class: css_class_name
    else
      image_tag default_img_path, alt: img_alt, class: css_class_name
    end
  end
end
