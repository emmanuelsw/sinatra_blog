require './config/environment'

I18n.load_path = Dir[File.join(File.dirname(__FILE__), 'config', 'locales', 'es.yml')]
I18n.available_locales = :es
I18n.default_locale = :es
I18n.backend.load_translations

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UsersController
use ArticlesController
run ApplicationController
