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
          group = ''
          if filter["cf_class"].empty?
            raise "The dashboard discovery method needs a Puppet Dashboard group specified; --do <group>"
          end
       end

        require 'rake'
        require '/usr/share/puppet-dashboard/config/boot.rb'
        RAILS_ENV.replace('production')
        require '/usr/share/puppet-dashboard/config/environment.rb'
        load '/usr/share/puppet-dashboard/Rakefile'

        discovered = []

        filter.keys.each do |key|
          case key
            when "identity"
              identity_search(group, discovered)
            when "cf_class"
              class_search(filter["cf_class"], discovered)
          end
        end

        # filters are combined so we get the intersection of values across
        unless client.options[:discovery_options].empty? or filter["cf_class"].empty?
          discovered = discovered.select{|element| discovered.count(element) > 1 }
          discovered = discovered.uniq
        end
        discovered
      end

      def self.identity_search(filter, discovered)
        return if filter.empty?

        group = filter
        names = NodeGroup.all.map(&:name)

        if ! names.include? "#{group}"
          puts "Puppet Dashboard group #{group} does not exist"
          return
        end

        Node.find(get_group(group).nodes).each do |groupnode|
          discovered << groupnode.name
        end
      end

      def self.class_search(filter, discovered)
        return if filter.empty?

        names = NodeClass.all.map(&:name)

        filter.each do |klass|
          if ! names.include? "#{klass}"
            puts "Puppet Dashboard class #{klass} does not exist"
            next
          end

          Node.find(get_class(klass).nodes).each do |classnode|
            discovered << classnode.name
          end
        end
      end

    end
  end
end
