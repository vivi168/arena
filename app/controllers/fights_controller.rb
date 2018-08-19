class FightsController < ApplicationController
  before_action :new_fight, only: [:new, :create]
  before_action :load_fight, only: [:show]
  before_action :load_fights, only: [:index]

  def create
    if @fight.save
      flash[:success] = t(:create_success)
      redirect_to @fight
    else
      render :new
    end
  end

  private

  def permitted_attrs
    params.fetch(:fight, {}).permit(:home_id, :away_id, :home_weapon_id, :away_weapon_id)
  end

  def new_fight
    @fight = Fight.new permitted_attrs
  end

  def load_fight
    @fight = Fight.find params[:id]
  end

  def load_fights
    @fights = Fight.all
  end
end