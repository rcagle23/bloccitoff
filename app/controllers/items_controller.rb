class ItemsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @item = @user.items.build(params.require(:item).permit(:name))

    if @item.save
      redirect_to @user, notice: "New to-do item was saved successfully."
    else
      flash[:error] = "Error creating new to-do item. Please try again."
      render :new
    end
  end
  
  def destroy
    @user = User.find(session[:user_id])
    @item = @user.items.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "To-do list item deleted."
    else
      flash[:error] = "Error removing to-do item. Please try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
