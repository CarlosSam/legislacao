class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.get_positive_votes(project)
  	Vote.where({project: project, status: true}).count(:all);
  end

  def self.get_negative_votes(project)
  	Vote.where({project: project, status: false}).count(:all);
  end

  def self.get_user_vote(project, user)
  	Vote.where({project:p, user: user})
  end

  def self.vote(project, user, status)
  	Vote.where({project:project, user: user}).destroy_all
  	Vote.new(project: project, user: user, status: status).save
  end
end
