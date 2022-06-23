module NotificationEngine
  class Railtie < ::Rails::Railtie
    initializer 'notification_engine.controller' do
      ActiveSupport.on_load :action_controller_base do
        ActionController::Base.send :include, NotificationEngine::Controller
      end
    end
  end
end
