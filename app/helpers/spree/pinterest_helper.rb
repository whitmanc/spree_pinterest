module Spree
  module PinterestHelper
    def facebook_button(product)
      url = escape spree.product_url(product)
      if @product and @product.images and @product.images.first
         media = escapeabsolute_image_url(@product.images.first.attachment.url)
       else 
         media = ""
       end
       
      description = escape product.name
        
      button = "<iframe src='//www.facebook.com/plugins/like.php?href=" + url + "&amp;send=false&amp;layout=button_count&amp;width=50&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21' scrolling='no' frameborder='0' style='border:none; overflow:hidden; margin-top:4px; width:50px; height:21px;float: left' allowTransparency='true'></iframe>"
      return button.html_safe
    end
    
    def pin_it_button(product)
      return if product.images.empty?

      url = escape spree.product_url(product)
      media = escape absolute_image_url(product.images.first.attachment.url)
      description = escape product.name

      link_to("Pin It",
              "http://pinterest.com/pin/create/button/?url=#{url}&media=#{media}&description=#{description}",
              :class => "pin-it-button",
              "count-layout" => "horizontal").html_safe
    end

    private

    def escape(string)
      string
    end

    def absolute_image_url(url)
      return url if url.starts_with? "http"

      request.protocol + request.host + url
    end
  end
end
