remote_file "#{Chef::Config[:file_cache_path]}/distribute_setup.py" do
  source "http://python-distribute.org/distribute_setup.py"
  mode "0644"
  not_if { ::File.exists?("/usr/bin/pip") }
end

bash "install-pip" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  /usr/bin/python2.5 distribute_setup.py
  /usr/bin/easy_install pip
  EOF
  not_if { ::File.exists?("/usr/bin/pip") }
end
