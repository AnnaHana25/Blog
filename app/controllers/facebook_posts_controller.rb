class FacebookPostsController < ApplicationController
  def create
    post_id = params[:post][:id]
    post = Post.find(post_id)

    user = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])

    message = "Новий пост на блозі: #{post.title}\n#{post.body}"

    options = { 'link' => post_url(post) }

    user.put_wall_post(message, options)

    redirect_to post, notice: 'Повідомлення успішно опубліковано на Facebook.'
  end
end
