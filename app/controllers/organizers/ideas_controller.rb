class Organizers::IdeasController < Organizers::BaseController

  def index

    tags = @organizer.tags
    @ideas = Idea.joins(:tags).where('tags.id IN (?)', tags.select(:id)).distinct.all.paginate(page: params[:page], per_page: 9)

  end


end
