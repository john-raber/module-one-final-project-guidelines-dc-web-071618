require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular 'stadium', 'stadiums'
end

ActiveRecord::Base.logger = nil
