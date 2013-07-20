module ItemsHelper
  def item_image_tag(item)
    if item.image.url
      link_to(image_tag(item.image), item)
    else
      if item.id
        link_to(image_tag("http://placekitten.com/#{140 + item.id}"), item)
      else
        link_to(image_tag("http://placekitten.com/#{rand(140..240)}"), new_item_path)
      end
    end
  end
end
