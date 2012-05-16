class DynamicalBaseController < ApplicationController

	def index
	
	end
	
	def do_it
	    @what_to_do = params[:what_to_do]
		
		begin
		  @result, @how = Thing.do_something(@what_to_do)
		  render "did_it"
		rescue DontKnowHowException => ex
		  render "dont_know_how"
		end
	end
	
	def thats_how
	    @what_to_do = params[:what_to_do]
		@how        = params[:how]
		
		Thing.learn_to_do(@what_to_do, @how)
		@result, @how = Thing.do_something(@what_to_do)
	    render "did_it"
	end

end