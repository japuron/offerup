class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@users.where.not(user_location_latitude: nil)) do |user, marker|
      marker.lat user.user_location_latitude
      marker.lng user.user_location_longitude
      marker.infowindow "<h5><a href='/users/#{user.id}'>#{user.email}</a></h5><small>#{user.user_location_formatted_address}</small>"
    end
  end

  # GET /users/1
  def show
    @comment = Comment.new
    @item = Item.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:username, :user_location)
  end
end
