$LOAD_PATH.concat([File.expand_path('../../api', __FILE__)])

module SchedulingApp
  class App < Grape::API
    class << self
      def app_name
        "Scheduling Application"
      end

      def cascade
        []
      end

      def root
        @_root ||= File.expand_path('..', __FILE__)
      end

      def dependencies
        @_dependencies ||= Dir[File.expand_path('../../api/**/*.rb', __FILE__)]
      end

      def setup_application!
        @_configured ||= begin
          Padrino.require_dependencies(dependencies, force: true)
          Grape::API.logger = Padrino.logger
          true
        end
      end

      def app_file
        ""
      end

      def public_folder
        ""
      end
    end

    setup_application!

    mount SchedulingApp::Api
  end
end