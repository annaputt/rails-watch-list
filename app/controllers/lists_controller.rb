class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
    @background_colors = ['#ff0000', '#00ff00', '#0000ff']
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully deleted.'
  end

private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
