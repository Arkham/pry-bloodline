module PryBloodline
  class Railtie < Rails::Railtie
    initializer 'pry-bloodline.initialize' do |app|
      PryBloodline.setup!
      PryBloodline.configure do |c|
        c.name = app.class.parent_name.underscore
      end
    end
  end
end
