module ApplicationHelper
  def hide_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def currency(price)
    # Adds price sign currently
    sprintf("$%0.02f", price)
  end

end
