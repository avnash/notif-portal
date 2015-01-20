class TagsController < ApplicationController

  def index
   if signed_in?
      @user=Subscribe.find_by_user_id(current_user.id)
      if @user
          @s=@user.subscriptions 
          @check=@s.split('|')
        else
          @check=''
        end
        @posts = []
        @check.each do |sa|
          @tag=Tag.find(sa)
          @posts = @posts + Tag.includes(:posts).find(@tag.id).posts.where("expired=?", false).reverse_order
        end
    else
       
       @posts = Post.where("expired=?",false).reverse_order
     end
  end
   
   

  def show
    @tag = Tag.find(params[:id])
  end

  def display
    @tag = Tag.find(params[:id])
    @posts = Tag.includes(:posts).find(@tag.id).posts.where("expired=?", false).reverse_order
  end

  def update
    @tag = Tag.find(params[:id])
    if params[:tags][:name].length!=0
      @tag.name = params[:tags][:name]
    end
    if params[:tags][:description].length!=0
      @tag.description = params[:tags][:description]
    end
    @tag.save
    redirect_to :back
  end

end
