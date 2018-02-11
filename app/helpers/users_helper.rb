module UsersHelper

  def invitations
    User.all.reject{|user| user == current_user}
  end
end
