%post

# Enable GCE data source only
cat <<EOF > /etc/cloud/cloud.cfg.d/50_gce_datasource.cfg
datasource_list: [ "GCE" ]
EOF

%end
