class HomeController < ApplicationController
  def index
    @posts = Post.all
    render :layout => 'top'
  end

  def about

  end
end
