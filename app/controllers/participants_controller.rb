class ParticipantsController < ApplicationController

	before_action :set_participant, only: [:summary]




  def summary
    count = @participant.activities.count
    if(count > 8) 
      @activities = @participant.activities[0..7]
    else
      @activities = @participant.activities
    end
    
    @ideas = Idea.where(:participant_id => params[:participant_id])

  end

  private
    def set_participant
      @participant = Participant.find(params[:participant_id])
    end

    def participant_params
      params.require(:participant).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end

end
