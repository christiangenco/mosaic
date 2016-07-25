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

  def html_button_to(html = nil, options = nil, html_options = nil)
    button_to(options, html_options) do
      html
    end
  end

  # see also: gravatar_profile_image_tag from cloudinary?
  def gravitar_image_tag(email, options={})
    options = options.symbolize_keys

    md5 = Digest::MD5.hexdigest(email)

    options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
    s = (options[:width] || options[:height] || 0) + (options[:height] || options[:width] || 0)

    options[:src] = "http://www.gravatar.com/avatar/#{md5}?s=#{s}"

    tag("img", options)
  end
end
