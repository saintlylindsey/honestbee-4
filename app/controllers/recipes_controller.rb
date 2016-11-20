class RecipesController < ApplicationController

	def index
		@recipes=Recipe.all
	end

	def new
		@recipe=Recipe.new
	end

	def create
		@recipe=Recipe.create( recipe_params )
		if @recipe.save 
			redirect_to new_recipe_step_path(@recipe)
		else 
			render :action => :new
		end
	end

	def edit
		@recipe=Recipe.find(params[:id])
	end

	def update
		@recipe=Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			flash[:notice]="Post was successfully updated"
			redirect_to edit_recipe_step_path(@recipe)
		else 
			flash[:notice]="Post was not saved. Please retry."
			render :action => :new	
		end
	end

	def show
		@recipe=Recipe.find(params[:id])
	end

	def destroy
		@recipe=Recipe.find(params[:id])
		@recipe.destroy
		redirect_to recipes_path
	end

	private

	def recipe_params
		params.require(:recipe).permit(:number,:description,:recipe_id)
	end

end
