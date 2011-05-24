module ApplicationHelper
  
  
  def render_body txt
    sanitize(RDiscount.new(txt).to_html)
  end
end
