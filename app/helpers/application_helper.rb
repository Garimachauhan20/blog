module ApplicationHelper
	def is_active?(link_path)
	  if current_page?(link_path)
	    "active"
	  else
	    ""
	  end
	end


  def isAdmin?(user)
    if user.role=='Admin'
      return true
    else
      return false
    end 
  end

  def liked?(post, user)
  	post.likes.find_by("user_id":user.id)
  end

end
