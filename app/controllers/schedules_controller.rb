class SchedulesController < ApplicationController
  skip_before_filter  :verify_authenticity_token, :only =>[:create, :destroy]
  def new
	@schedule = Schedule.new
  end
  def index
	@userID = params[:userID]
	@schedule = Schedule.where(:userID => params[:userID])
	respond_to do|format|
		format.html
		format.json{render :json => @schedule.to_json}
		format.xml{render :xml => @schedule.to_xml}
	end
  end
  
  def create
	@schedule = Schedule.new(post_params)

	respond_to do |format|
		if @schedule.save
			format.html{ render json: @schedule, notice => "saved"}
			format.json{ render json: @schedule, status: :created}
		else
			format.html{ render action: "new"}
			format.json{ render json: @schedule.errors, status: :unprocessable_entity}
		end
	end
	
  end
  def update
  end

  def destroy
	@userID = Schedule.find(params[:id]).userID
	@schedule = Schedule.where(:userID => @userID)
	if Schedule.destroy(params[:id])
			render json: @schedule, notice => "save"
			#redirect_to schedules_index_path(:userID => @userID), :notice => "saved"
	else
			render "show"
	end
  end
  
  def show
	@schedule = Schedule.find(params[:id])
  end
  
  private
    def post_params
        params.require(:schedule).permit(:year, :month, :day, :remind_date, :remind_time, :ring, :sumbit, :accept, :image, :title, :category, :note, :star, :userID)
    end
end
