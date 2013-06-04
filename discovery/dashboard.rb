# discovers against a flatfile instead of the traditional network discovery
# the flat file must have a node name per line which should match identities
# as configured
module MCollective
  class Discovery
    class Dashboard
      def self.discover(filter, timeout, limit=0, client=nil)
        unless client.options[:discovery_options].empty?
          group = client.options[:discovery_options].first
        else
          raise "The dashboard discovery method needs a Puppet Dashboard group specified; --do <group>"
        end

        discovered = []

        require 'rake'
        require '/usr/share/puppet-dashboard/config/boot.rb'
        RAILS_ENV.replace('production')
        require '/usr/share/puppet-dashboard/config/environment.rb'
        load '/usr/share/puppet-dashboard/Rakefile'

        names = NodeGroup.all.map(&:name)

        if ! names.include? "#{group}"
          raise "Puppet Dashboard group #{group} does not exist"
        end

        puts "Puppet Dashboard group: #{group}"
        Node.find(get_group(group).nodes).each do |groupnode|
          discovered << groupnode.name
        end

        if discovered.empty?
          raise "No nodes discovered in Puppet Dashboard group #{group}"
        end

        discovered
      end
    end
  end
end
