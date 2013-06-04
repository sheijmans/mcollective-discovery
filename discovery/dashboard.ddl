metadata    :name        => "dashboard",
            :description => "Puppet Dashboard group based discovery for node identities",
            :author      => "S. Heijmans",
            :license     => "ASL 2.0",
            :version     => "0.1.1",
            :url         => "https://github.com/sheijmans/mcollective-discovery",
            :timeout     => 0

discovery do
    capabilities :identity
end
