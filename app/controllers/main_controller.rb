class MainController < ApplicationController
  def index
  	respond_to do |format|
  		format.html
  		format.json { render json: DemoMain.new(view_context) }
  	end
  end
end
