require 'chef/provider/package/dpkg'

class Chef
  class Provider
    class Package
      class Gdebi < Chef::Provider::Package::Dpkg
        def install_package(name, version)
          opts = @new_resource.options ? "--option='#{@new_resource.options}'" : ""
          shell_out!(
            "gdebi --quiet --non-interactive #{opts} #{@new_resource.source}",
            environment: { "DEBIAN_FRONTEND" => "noninteractive" }
            )
        end
      end
    end
  end
end
