class RecipesController < ApplicationController
  before_filter :authenticate_user

  def index
    @recipes = Recipe.all

  end


  def show
    @recipe = Recipe.find(params[:id])

  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
    @categories = Category.all

  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(params[:recipe])
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render action: "edit"
    end
  end

# DELETE /recipes/1
# DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_url
  end

  private
  def authenticate_user
    unless current_user
      redirect_to login_path, notice: 'Please log in'
    end
  end

end


