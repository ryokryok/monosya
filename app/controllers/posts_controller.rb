class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to root_url
    else
      flash[:alert] = '入力を確認してください。画像は必須です。'
      render 'posts/new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:image,:title,:message)
    end

end
