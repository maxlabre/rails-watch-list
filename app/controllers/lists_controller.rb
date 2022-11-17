class ListsController < ApplicationController
  before_action :lists_find, only: [:show]

  def index
    @lists = List.all
  end

  def show
    # va chercher dans paramètres
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path(list_params)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def lists_find
    @list = List.find(params[:id])
  end

end
