class SubscriptionController < ApplicationController

def index
	@sai="saikiran"
	@user=Subscribe.find_by_user_id('199')
	@s=@user.subscriptions
	@check=@s.split('|')
end

def show
end
def update

	roll=session[:user_id]=199
	@user=Subscribe.find_by_user_id(roll)
	array=params[:list]
	var=""
	array.each do |a|
		 var+=a.to_s+'|'
	end
	var=var.chomp('|')
	#raise array.inspect
	if @user
		@user.update(:subscriptions=>var)
	else
		@subscribe=Subscribe.new()
		@subscribe.subscriptions=var
		@subscribe.user_id=roll
		@subscribe.save
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end
	#redirect_to root_path
end

end
