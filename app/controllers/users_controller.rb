class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new

  end

  def create

    if params[:id] then
      person = User.find(params[:id])
    else
    	person = User.new()
    end

  	person[:first_name] = params[:first_name]
  	person[:last_name] = params[:last_name]
  	person[:email] = params[:email]
  	if params[:password] then
      person[:password] = params[:password]
    end
  	# User.create(first_name: @first_name, last_name: @last_name, email: @email, password: @password)

  	if person.valid? then
  		person.save
  		flash[:notice] = 'User saved just fine!'
  		redirect_to('/') # go to index.
  	else
  		flash[:alert] = person.errors.full_messages
	  	render 'new'
  	end

  end

  def destroy
    id = params[:id]
    if id then
      User.destroy(id)
      flash[:notice] = "The user has been deleted."
    else
      flash[:notice] = "Something went wrong deleting the user record: "+id.to_s
    end
    redirect_to('/')
  end

  def edit
    @user = User.find(params[:id])
  end

  def view
    @user = User.find(params[:id])
  end

end
