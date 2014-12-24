class TagMailer < ActionMailer::Base
  default from: "ch12b034@smail.iitm.ac.in"
  def tag_notify(recipient,tagged_by,object)
    @recipient = recipient
    @tagged_by = tagged_by
    @object = object
    mail(to:@recipient+'@smail.iitm.ac.in',subject:'Feedback Forum')
  end
end
