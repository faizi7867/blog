class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Category, Article
    elsif  user.roles.first.role == 'Admin' 
      can :manage, :all
    elsif user.roles.first.role == 'user'
      can :addComment, :all
    elsif user.roles.first.role == 'Author'
      can :postArticle, Category
    elsif user.roles.first.role == 'moderator'
      can :edit, Postcomment
    end
  end
end
