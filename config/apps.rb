Padrino.configure_apps do
  set :session_secret, 'af916588902b65f200baca2f2db460935281e2d64d452d7689e1071b151afae3'
  set :protection, :except => :path_traversal
  set :protect_from_csrf, true
end

require Padrino.root('app/app.rb')

Padrino.mount('SchedulingApp::App', app_file: Padrino.root('app/app.rb')).to('/')