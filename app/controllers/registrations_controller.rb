class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def register
    @user = User.new(params[:user])

  if @user.valid?
    @user.save
    UserMailer.welcome_email(@user).deliver
    session[:user_id] = @user.id
    flash[:notice] = 'Welcome.'
    redirect_to :root
  else
    render 'new_user'
  end
    

  def update
    super
  end
    
  end
end 