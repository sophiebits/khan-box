apt_repository "fkrull-deadsnakes" do
  uri "http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu"
  distribution node[:lsb][:codename]
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "DB82666C"
end

package "python2.5"
package "python2.5-dev"
