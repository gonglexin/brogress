module UsersHelper
  def user_image_tag(user, options = {})
    #if user.email
      #link_to(image_tag(user.email, options), user)
    #else
      if user.id
        link_to(image_tag("http://placekitten.com/#{140 + user.id}", options), user)
      else
        link_to(image_tag("http://placekitten.com/#{rand(140..240)}", options), new_user_path)
      end
    end
  #end
end
