Pry.config.color = true

Pry.config.prompt = proc do |obj, _nest_level, _pry_|
  version = ''
  version << "Rails#{Rails.version}" if defined? Rails
  version << "\001\e[0;31m\002"
  version << RUBY_VERSION.to_s
  version << "\001\e[0m\002"

  "#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end
