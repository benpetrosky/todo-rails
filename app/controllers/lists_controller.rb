class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
      # redirect_to  list_path(@list)
    else
      render :edit
    end
  end


  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Your list was saved successfully!"
      #redirect to individual list item
      redirect_to  list_path(@list)

      #redirect to the lists page
      # redirect_to  lists_path
    else
      flash[:alert] = "fill in a name please!"
      render :new
    end
  end

private

  def list_params
    params.require(:list).permit(:name)
  end

end
