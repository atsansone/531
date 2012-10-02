module ApplicationHelper

  #Markdown that preserves tags
  def md(string)
    RDiscount.new(string, :smart).to_html.html_safe
  end

  #Markdown that strips tags (used for one-liners, like titles, to achieve smart quotes)
  def mds(string)
    strip_tags(RDiscount.new(string, :smart).to_html)
  end


end
