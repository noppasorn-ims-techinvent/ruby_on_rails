module CatsHelper
    def valid_css_color?(color)
        css_colors = ["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "purple", "red", "silver", "teal", "white", "yellow"]
        css_colors.include?(color.downcase) || color.match?(/\A#(?:[0-9a-fA-F]{3}){1,2}\z/)
      end
    
      def display_color_block(color)
        if valid_css_color?(color)
          content_tag(:div, '', style: "background-color: #{color}; width: 20px; height: 20px; border: 1px solid #000;")
        else
          content_tag(:div, 'N/A', style: "width: 20px; height: 20px; border: 1px solid #000; line-height: 20px; text-align: center;")
        end
      end
end
