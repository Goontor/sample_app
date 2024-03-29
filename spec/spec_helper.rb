require 'spork'

Spork.prefork do
  # En charger plus dans ce bloc accélèrera les tests. Cependant, 
  # si vous changez de configuration ou le code des
  # librairies chargées ici, vous devrez redémarrer spork.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  Rspec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    config.include(Module.new {
      def self.included(base)
       base.render_views
      end
    }, :type => :controller)  
    config.mock_with :rspec

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, comment the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
  end
end
 
Spork.each_run do
 
end