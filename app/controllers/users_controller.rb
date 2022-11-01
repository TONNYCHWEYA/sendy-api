class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  # def index
  #   @users = User.all
  #   render json: @users
  # end

  def show
    @user = User.find_by(id: session[:user_id])
    if @user
      render json: @user
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end

  def new
    @author = Author.new
  end
  # GET /users/1
  # def show
  #   @user = User.find_by(id: session[:user_id])
  #   if @user
  #     render json: @user
  #   else
  #     render json: { error: 'Not authorized' }, status: :unauthorized
  #   end
  # end

  # POST /users
  def create
    @user = User.create(user_params)
    # respond_to do |_format|
    if @user.valid?
      # Tell the UserMailer to send a welcome email after confirming validity
      # UserMailer.with(user: @user).welcome_email.deliver_later
      # format.html { redirect_to(@user, notice: 'User was successfully created.') }
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :username, :password, :email_address)
  end
end
