class RecipesController < ApplicationController
    before_action :set_recipe, only: [:edit, :update]
    before_action :get_ingredients, only: [:new, :edit]
    def new 
        @recipe = Recipe.new
    end

    def index
        @recipes = Recipe.all
    end

    def show 
        @recipe = Recipe.find(params[:id])
    end

    def edit 
    end

    def create
        @recipe = Recipe.create(recipe_params)
        # binding.pry
        if @recipe.save 
            redirect_to recipe_path(@recipe)
        else 
            render :new
        end
    end

    def update 
        @recipe.update(recipe_params)
        if @recipe.save 
            redirect_to recipe_path(@recipe)
        else 
            render :edit
        end

    end

    private

    def set_recipe 
        @recipe = Recipe.find(params[:id])
    end

    def get_ingredients 
        @ingredients = Ingredient.all
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
