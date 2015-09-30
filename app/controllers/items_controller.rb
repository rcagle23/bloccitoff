class ItemsController < ApplicationController
  def create
    @user = User.find_by_confirm_token(params[:id])
    @item = @user.items.build(params.require(:item).permit(:name))

    if @item.save
      redirect_to @user, notice: "New item was saved successfully."
    else
      flash[:error] = "Error creating new item. Please try again."
      render :new
    end
  end
end
