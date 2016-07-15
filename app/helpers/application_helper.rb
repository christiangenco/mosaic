module ApplicationHelper
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      underline: true,
      highlight: true,
      footnotes: true,
      tables: true
    })
    @markdown.render(content)
  end

  def strip_order(str="")
    str =~ /[\d\.]+\s*(.*)/
    $1 || str
  end

  def admin?
    user_signed_in? && current_user.admin?
  end
end
