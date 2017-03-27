require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ColoredSmokeShop
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale    = :ru
    config.time_zone              = 'Moscow'
    config.site_url_punycode      = 'xn--b1aecqqdh4a7a9c.xn--p1ai'
    config.site_email             = 'info@цветнойдым.рф'
    config.site_email_punycode    = 'info@xn--b1aecqqdh4a7a9c.xn--p1ai'
    config.site_phone             = '+79651774201'
    config.site_phone_formatted   = '+7 (965) 177-42-01'
    config.site_vk                = 'tsvet_dym'
    config.site_instagram         = '_colored_smoke_'

    config.autoload_paths += %W(#{config.root}/lib)
  end
end
