module ItemsHelper
  def item_image_tag(item, options = {})
    if item.image.url
      link_to(image_tag(item.image, options), item)
    else
      if item.id
        link_to(image_tag("http://placekitten.com/#{140 + item.id}", options), item)
      else
        link_to(image_tag("http://placekitten.com/#{rand(140..240)}", options), new_item_path)
      end
    end
  end
end
