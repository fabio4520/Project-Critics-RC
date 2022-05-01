class CriticsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_critic, only: %i[ show edit update destroy ]

  # POST /games/:game_id/critics
  # POST /companies/:company_id/critics
  def create
    if params[:game_id]
       @game = Game.find(params[:game_id])
       comment = @game.critics.new(critic_params)
    elsif params[:company_id]
      @company = Company.find(params[:company_id])
      comment = @company.critics.new(critic_params)
    end

    if comment.save
      if params[:game_id]
        redirect_to game_path(@game), notice: "Critic was successfully created."
      elsif params[:company_id]
        redirect_to company_path(@company), notice: "Critic was successfully created."
      end
    else
      redirect_to game_path(@game)  # PENDING render :new, status: :unprocessable_entity
    end
  end

  # DELETE /games/:game_id/critics/:id
  # DELETE /companies/:company_id/critics/:id
  def destroy
    if params[:game_id]
      @game = Game.find(params[:game_id])
      @comment = @game.critics.find(params[:id])
      # comment.delete
      # redirect_to game_path(@game), action: "get", notice: "Critic was successfully destroyed."
   elsif params[:company_id]
     @company = Company.find(params[:company_id])
     @comment = @company.critics.find(params[:id])
     # comment.delete
     # redirect_to company_path(@company), action: "get", notice: "Critic was successfully destroyed."
   end
   @comment.delete
    # if params[:game_id]
    #   # redirect_to game_path(@game), action: "get", notice: "Critic was successfully destroyed."
    #   render game_path(@game)
    # elsif params[:company_id]
    #   # redirect_to company_path(@company), action: "get", notice: "Critic was successfully destroyed."
    #   render company_path(@company)
    # end
    render json: nil, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critic
      @critic = Critic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def critic_params
      params.require(:critic).permit(:title, :body, :user_id)
    end
end
