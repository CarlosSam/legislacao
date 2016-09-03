class Project < ActiveRecord::Base

	def upvotes
		Vote.where({project: self, status: true}).count(:all);
	end

	def downvotes
		Vote.where({project: self, status: false}).count(:all);
	end

	def netvotes
		self.upvotes - self.downvotes
	end

	def user_vote(user)
		vote = Vote.where({project: self, user: user})[0];
		if vote.nil?
			return
		end
		vote.status
	end
end
