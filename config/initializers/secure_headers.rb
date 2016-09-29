Rails.application.config.after_initialize do |app|
  SecureHeaders::Configuration.default do |config|
    app.reload_routes!

    allowed_sources = %w(
      'self'
      https://*.googleapis.com
      https://*.gstatic.com
      https://*.scrivito.com
      https://*.scrvt.com
      https://scrivito-public-cdn.s3-eu-west-1.amazonaws.com
      https://scrivito-upload.s3-eu-west-1.amazonaws.com
      https://scrivito-upload.s3-accelerate.amazonaws.com
    )

    data = %w(data:)
    unsafe_inline = %w('unsafe-inline')

    config.csp = {
      default_src: allowed_sources,
      font_src: data + allowed_sources,
      img_src: data + allowed_sources,
      style_src: unsafe_inline + allowed_sources,
    }
  end
end
