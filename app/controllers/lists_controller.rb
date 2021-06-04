class ListsController < ApplicationController
  before_action :find, only: [:show, :destroy]

    def index
      @lists = List.all
    end

    def create
      @list = List.new(require_params)
      if @list.save
        redirect_to list_path(@list)
      else
        render :new
      end
    end

    def destroy
      @list.destroy
      redirect_to lists_path
    end

    def new

      @list = List.new
    end

    def show
      @bookmark = Bookmark.new
      @list = List.find(params[:id])
    end

    private

    def require_params
      params.require(:list).permit(:name)
    end

    def find
      @list = List.find(params[:id])
    end

end

end
