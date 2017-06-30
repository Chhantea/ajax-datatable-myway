class MainController < ApplicationController
  def index
  	respond_to do |format|
  		format.html
  		format.json { render json: DemoMain.new(view_context) }
  	end
  end
   def door
   	@s = Something.find(params[:id])
   	
   end
end
