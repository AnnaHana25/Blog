class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Пост успішно створено.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Пост успішно оновлено.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Пост успішно видалено.'
  end

  # def publish_to_facebook
  #   user = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])

  #   message = "Новий пост на блозі: #{@post.title}"

  #   options = { 'link' => post_url(@post), 'picture' => @post.image.url(:thumb) }

  #   user.put_wall_post(message, options)

  #   redirect_to @post, notice: 'Повідомлення успішно опубліковано на Facebook.'
  # end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
