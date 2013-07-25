module ItemsHelper
  def item_image_tag(item, options = {})
    image_service = 'http://placekitten.com/'
    #image_service = 'http://placehold.it/'
    if item.image.url
      link_to(image_tag(item.image, options), item)
    else
      if item.id
        link_to(image_tag("#{image_service}#{140 + item.id}", options), item)
      else
        link_to(image_tag("#{image_service}#{rand(140..240)}", options), new_item_path)
      end
    end
  end
end
