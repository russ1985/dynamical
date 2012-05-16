class DontKnowHowException < Exception
end

class Thing < ActiveRecord::Base

	class << self
	  def do_something(what)
		thing = self.where('what = ?', what).first
		raise DontKnowHowException, "Don't know how" if thing.nil?
		thing.do_it
	  end
	  
	  def learn_to_do(what, how)
	    thing = self.where('what = ?', what).first
		if thing.nil?
	      Thing.create(:what => what, :times_done_it => 0, :how => how)
		else
		  thing.how = how
		  thing.save
		  thing
		end		
	  end
	end
	
	def do_it
	  begin
	    self.times_done_it = (self.times_done_it + 1)
	    self.save
	    return eval(self.how), self.how
	  rescue Exception => ex
		return ex.message, self.how
	  end
	end

end