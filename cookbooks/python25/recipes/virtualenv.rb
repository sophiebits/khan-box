bash "install-virtualenv" do
  code <<-EOF
  /usr/bin/pip install virtualenv
  EOF
  not_if { ::File.exists?("/usr/bin/virtualenv") }
end