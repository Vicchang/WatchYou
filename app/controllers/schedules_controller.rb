class SchedulesController < ApplicationController
  skip_before_filter  :verify_authenticity_token, :only =>[:create]
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
	if @schedule.save
		redirect_to schedules_index_path(:userID => @schedule.userID), notice => "saved"
	else
		render "new"
	end
  end
  def update
  end

  def delete
	if Schedule.destroy(params[:id])
			redirect_to schedules_index_path, :notice => "saved"
		else
			render "Show"
		end
  end
  
  def show
	@schedule = Schedule.find(params[:id])
  end
  
  private
    def post_params
        params.require(:schedule).permit(:date, :title, :category, :note, :star, :userID)
    end
end
