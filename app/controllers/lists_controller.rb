class ListsController < ApplicationController


  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
