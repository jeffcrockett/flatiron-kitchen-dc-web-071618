require 'pry'
class IngredientsController < ApplicationController
    def new
        @ingredient = Ingredient.new
    end

    def create 
        @ingredient = Ingredient.create(ingredient_params)
        # binding.pry
        if @ingredient.save 
            # binding.pry
            redirect_to ingredient_path(@ingredient)
        else 
            render :new
        end
    end

    def show 
        @ingredient = Ingredient.find(params[:id])
    end

    def edit 
        @ingredient = Ingredient.find(params[:id])
    end

    def update 
        @ingredient = Ingredient.find(params[:id])
        @ingredient.update(ingredient_params)
        if @ingredient.save 
            redirect_to ingredient_path(@ingredient)
        else 
            render :edit 
        end
    end

    private 
    def ingredient_params 
        params.require(:ingredient).permit(:name, ingredient_ids: [])
    end
end
