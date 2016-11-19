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
			flash[:notice]="Image has been uploaded."
			redirect_to recipes_path
		else 
			flash[:notice]="Image was not saved. Please retry."
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
			redirect_to recipe_path(@recipe)
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
		params.require(:recipe).permit(:avatar,:name,:description,:preptime)
	end

end
