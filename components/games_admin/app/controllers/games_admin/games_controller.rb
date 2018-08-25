require_dependency "games_admin/application_controller"

module GamesAdmin
  class GamesController < ApplicationController
    before_action :set_game, only: [:show, :edit, :update, :destroy]

    # GET /games
    def index
      @games = AppComponent::Game.all
    end

    # GET /games/1
    def show
    end

    # GET /games/new
    def new
      @game = AppComponent::Game.new
    end

    # GET /games/1/edit
    def edit
    end

    # POST /games
    def create
      @game = AppComponent::Game.new(game_params)

      if @game.save
        redirect_to @game, notice: 'AppComponent::Game was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /games/1
    def update
      if @game.update(game_params)
        redirect_to @game, notice: 'AppComponent::Game was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /games/1
    def destroy
      @game.destroy
      redirect_to games_url, notice: 'AppComponent::Game was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_game
        @game = AppComponent::Game.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def game_params
        params.require(:game).permit(:date, :location, :first_team_id, :second_team_id, :winning_team, :first_team_score, :second_team_score)
      end
  end
end
