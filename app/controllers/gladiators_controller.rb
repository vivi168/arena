class GladiatorsController < ApplicationController
  before_action :new_gladiator, only: [:new, :create]
  before_action :load_gladiator, only: [:show, :edit, :update, :destroy]
  before_action :load_gladiators, only: [:index]

  def create
    if @gladiator.save
      flash[:success] = t(:create_success)
      redirect_to gladiators_path
    else
      render :new
    end
  end

  def update
    if @gladiator.update_attributes(permitted_attrs)
      flash[:success] = t(:update_success)
      redirect_to gladiators_path
    else
      render :edit
    end
  end

  def destroy
    @gladiator.destroy
    flash[:success] = t(:delete_success)
    redirect_to gladiators_path
  end

  private

  def permitted_attrs
    params.fetch(:gladiator, {}).permit(:name)
  end

  def new_gladiator
    @gladiator = Gladiator.new permitted_attrs
  end

  def load_gladiator
    @gladiator = Gladiator.find params[:id]
  end

  def load_gladiators
    @gladiators = Gladiator.all
  end
end