class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :like, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :ensure_admin!, except: [:index, :show, :new, :create, :update, :like]

  # GET /users
  def index
    @users = User.order(cached_points: :desc)
    # @users = @users.sort_by{|u|
    #   [4,6].index(u.id) ? u.cached_points / 2.0 : u.cached_points
    # }.reverse

    render 'users/index', locals: {users: @users}
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to challenge_path(@challenge, anchor: 'users'), notice: 'Your user was sent and is queued to be checked'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      if request.xhr?
        # render :json => {success: true}
        render 'users/_list_item', locals: {user: @user}, layout: false
      else
        redirect_to @user, notice: 'User was successfully updated.'
      end
    else
      if request.xhr?
        # render :json => @user.errors, :status => :unprocessable_entity
        render 'users/_list_item', locals: {user: @user}, layout: false
      else
        render :edit
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def user_params
    #   if current_user.try(:admin?)
    #     params.require(:user).permit(:challenge_id, :user_id, :is_private, :approved_at, :denied_at, :url, :content, :points)
    #   else
    #     params.require(:user).permit(:is_private, :url, :content)
    #   end
    # end
end
