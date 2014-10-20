module PryBloodline
  class Railtie < Rails::Railtie
    initializer 'pry-bloodline.initialize' do |app|
      PryBloodline.setup!
    end
  end
end
