class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token, :only =>[:create]

  
  def index
	@user = User.all
	respond_to do |format|
		format.html
		format.xml { render :xml => @user.to_xml }
		format.json { render :json => @user.to_json }
    end
  end
  
  def new
	@user = User.new
  end
	
  def create
	@user = User.new(post_params)
	
	respond_to do |format|
		if @user.save
			format.html{ redirect_to users_index_path, notice => "saved"}
			format.json{ render json: @user, status: :created}
		else
			format.html{ render action: "new"}
			format.json{ render json: @user.errors, status: :unprocessable_entity}
		end
	end
  end
	
  def update
		@user = User.find(params[:id])
		
		if @user.update_attributes(post_params)
			redirect_to user_path, :notice => "saved"
		else
			render "Edit"
		end
  end

  def delete
		@schedule = Schedule.where(:userID => params[:id])
		if @schedule.destroy_all && User.destroy(params[:id])
			redirect_to users_index_path, :notice => "saved"
		else
			render "show"
		end
  end
  
  def show
  	@user = User.find(params[:id])
  end
  

    # render json: @user
  private
    def post_params
        params.require(:user).permit(:name, :email, :password)
    end

end
