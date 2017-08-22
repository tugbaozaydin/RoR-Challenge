class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category

    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category

    else
      render "new"
    end
  end

  def destroy
    @category = Category.find(params[:slug])
    @category.destroy
    redirect_to category_path
  end

  private
  def category_params
    params.require(:profile).permit(:name)
  end
end
