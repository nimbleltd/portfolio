module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
       (link_to "Sign up", new_user_registration_path) + "<br>".html_safe +
       (link_to "Login", new_user_session_path)
    else
       link_to "Logout", destroy_user_session_path, method: :delete
    end
  end

  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]}!!! And you are here: #{layout_name}")
    end
  end

  def copyright_generator
    NimbleltdViewTool::Renderer.copyright 'Paul Campbell', 'All rights reserved'
  end

end
