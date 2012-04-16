package "python-mysqldb"
package "unzip"

remote_file "#{Chef::Config[:file_cache_path]}/google_appengine_1.6.4.zip" do
  source "http://googleappengine.googlecode.com/files/google_appengine_1.6.4.zip"
  checksum "ebb5f896f5b2f52427d8c31d2901f141d552c3549a4042684f5ffd9ecdf00c3f"
  mode "0644"
  not_if { ::File.exists?("/usr/local/google_appengine") }
end

bash "install-gae" do
  cwd "/usr/local"
  code <<-EOF
  unzip #{Chef::Config[:file_cache_path]}/google_appengine_1.6.4.zip
  EOF
  not_if { ::File.exists?("/usr/local/google_appengine") }
end

cookbook_file "/etc/profile.d/google_appengine.sh" do
  mode "0644"
end
