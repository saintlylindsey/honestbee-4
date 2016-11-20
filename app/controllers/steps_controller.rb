class StepsController < ApplicationController

	before_action :set_recipe

	def index
	end
	
	def new
		@step=@recipe.steps.new
	end

	def create
		@step=@recipe.steps.create( recipe_params )
		@step.save 
		# 	flash[:notice]="Recipe has been saved."
		# 	redirect_to recipe_path(@recipe)
		# else 
		# 	flash[:notice]="Recipe was not saved. Please retry."
		# 	render :action => :new
		# end
	end

	def edit 
	end

	def update
	end

	protected 

	def set_recipe
	 	@recipe = Recipe.find(params[:recipe_id])
	end

	def steps_params
		params.require(:steps).permit(:avatar,:name,:description,:preptime)
	end

end