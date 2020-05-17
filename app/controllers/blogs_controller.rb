class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params.require(:blog).permit(:title, :description))
    if @blog.save
      flash[:notice] = "Blog is created successfully"
      redirect_to blogs_path
      # redirect_to @blog
    else
      render 'new'
    end
    # redirect_to blog_path(@blog)
    # render plain: @blog.inspect
  end


  def update
    @blog = Blog.find(params[:id])
    if @blog.update(params.require(:blog).permit(:title, :description))
      flash[:notice] = "Blog is updated successfully"
      # redirect_to blogs_path
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end


end
