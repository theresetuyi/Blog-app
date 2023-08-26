module ApplicationHelper
  def user_posts_path(user, host: 'localhost:3000')
    Rails.application.routes.url_for(controller: 'posts', action: 'index', user_id: user.id, host:)
  end
end
