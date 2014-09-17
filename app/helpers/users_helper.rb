module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end

  def image_for(user)
  	facebookid = user.facebook
    if user.avatar_file_name
      image_tag(user.avatar.url(:square), alt: user.fullname, class: "facebookpic")
    elsif facebookid.nil? or facebookid.blank?
  		if user.gender == "f"
  			gender = "female"
  		else
  			gender = "male"
  		end
  		image_tag("box_#{gender}.gif", class: "facebookpic", alt: user.fullname)
  	else
  		facebookurl = "https://graph.facebook.com/#{facebookid}/picture?width=150&height=150"
  		image_tag(facebookurl, alt: user.fullname, class: "facebookpic")
  	end
  end
end
