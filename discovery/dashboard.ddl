metadata    :name        => "dashboard",
            :description => "Puppet Dashboard group/class based discovery for node identities",
            :author      => "S. Heijmans",
            :license     => "ASL 2.0",
            :version     => "0.2.0",
            :url         => "https://github.com/sheijmans/mcollective-discovery",
            :timeout     => 0

discovery do
    capabilities [:identity, :classes]
end
