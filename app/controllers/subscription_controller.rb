class SubscriptionController < ApplicationController

def index
	@sai="saikiran"
	@user=Subscribe.find_by_user_id(current_user.id)
	if @user
		@s=@user.subscriptions 
		@check=@s.split('|')
    else
    	@check=''
    end

end

def show
end
def update

	@user=Subscribe.find_by_user_id(current_user.id)
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
		@subscribe.user_id=current_user.id
		@subscribe.save
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end
	#redirect_to root_path
end

end
