class CspReportsController < ApplicationController

  protect_from_forgery except: :create

  def create
    parse_params = ActiveSupport::JSON.decode(request.raw_post)
    Honeybadger.notify({
      error_class: "CSP violation report",
      error_message: "Violated directive: #{parse_params['csp-report'].to_h['violated-directive']}",
      rack_env: request.env,
      context: parse_params,
    })
    render(nothing: true)
  end

end
