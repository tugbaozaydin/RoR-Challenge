class UsersController < ApplicationController
	def index
    @users = User.includes(:profile).all
  end

  def new
    @user = User.new
    @user.build_profile if @user.profile.nil?
  end

  def show
    @user = User.includes(:profile).find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user.build_profile if @user.profile.nil?
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Hesabınız başarıyla oluşturuldu'
    else
      render :new
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                
                                 profile_attributes: %i[first_name last_name])
  end
end
