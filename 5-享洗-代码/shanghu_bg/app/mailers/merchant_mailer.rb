class MerchantMailer < ApplicationMailer
  default from: 'm18800105727@163.com'
  # def welcome_email
  #   @mail = 'm18800105727@163.com'
  #   mail to: @mail, subject: 'Welcome to My Awesome Site'
  # end
  def send_mail(a, mail, path)
    @url  = 'http://' + path + '/register/create?msg=' + a
    mail(
        :to => mail,
        :from => 'm18800105727@163.com',
        :subject => '认证'
    )
  end
end
