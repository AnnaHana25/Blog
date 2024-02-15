class FacebookPostsController < ApplicationController
  def create
    # Отримайте параметри, які прийшли з форми
    post_id = params[:post][:id]
    post = Post.find(post_id)

    # Отримайте доступ до об'єкта користувача Koala
    user = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])

    # Створіть повідомлення для публікації на Facebook
    message = "Новий пост на блозі: #{post.title}\n#{post.body}"

    # Опціонально, вкажіть параметри, такі як зображення, посилання, тощо.
    options = { 'link' => post_url(post) }

    # Опублікуйте повідомлення на стіні користувача
    user.put_wall_post(message, options)

    # Опціонально, перенаправте користувача або виконайте інші дії після успішної публікації
    redirect_to post, notice: 'Повідомлення успішно опубліковано на Facebook.'
  end
end
