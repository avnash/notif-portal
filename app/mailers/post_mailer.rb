class PostMailer < ActionMailer::Base
  default from: "ch12b034@smail.iitm.ac.in"
  
  def post_notify(recipient,post_title)
    @recipient = recipient
    @recipient_name = User.find_by(username:recipient).fullname
    @post_title = post_title
    mail(to:@recipient+"@smail.iitm.ac.in",subject:"Tagged in post '#{post_title}'")
  end
end
