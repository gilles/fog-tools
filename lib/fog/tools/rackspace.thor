require 'fog'
require 'fog/core/credentials'

module Fog
  module Tools

    module Rackspace

      module Base
        def connection
          @connection ||= ::Fog::Rackspace::Compute.new(
                  :rackspace_api_key  => ::Fog.credentials[:rackspace_api_key],
                  :rackspace_username => ::Fog.credentials[:rackspace_username]
          )
        end

        def server_id(server_name)
          connection.servers.select do |s|
            s.name == server_name
          end
        end
      end

      class Tools < Thor
        include Fog::Tools::Rackspace::Base

        namespace :rs

        desc "reboot SERVER", "reboot a server"
        method_options :mode => "soft"

        def reboot(server_name)
          selected = server_id(server_name)

          unless selected
            say "Can't find server #{server_name}"
            return
          end

          selected[0].reboot(options.mode.upcase)
          selected[0].wait_for { print "."; ready? }

        end


      end

    end
  end

end
