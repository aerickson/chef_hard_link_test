# TODO: use variables
#
# fqdn = // logic to get fqdn
#
# file '/tmp/file' do
#   content "fqdn=#{fqdn}"
# end


### init

directory '/tmp/chef_hard_link_test' do
  mode '0755'
  action :create
end


### do things

cookbook_file '/tmp/chef_hard_link_test/foo.txt' do
  source 'foo.txt'
  mode '0755'
  action :create
end

cookbook_file '/tmp/chef_hard_link_test/foo.txt' do
  source 'foo.txt'
  mode '0755'
  action :create
end

# an app does this in my env
link '/tmp/chef_hard_link_test/foo2.txt' do
  to '/tmp/chef_hard_link_test/foo.txt'
  link_type :hard
end
# an extra hardlink for fun
link '/tmp/chef_hard_link_test/foo3.txt' do
  to '/tmp/chef_hard_link_test/foo.txt'
  link_type :hard
end

# will it explode?
cookbook_file '/tmp/chef_hard_link_test/foo.txt' do
  # use different content to simulate 'real world' where time
  # has passed and source has now changed.
  #
  source 'foo_v2.txt'
  mode '0755'
  action :create
end


### print debug info

results = "/tmp/output.txt"
file results do
  action :delete
end

cmd = "ls -li /tmp/chef_hard_link_test/*"
bash cmd do
  code <<-EOH
  #{cmd} &> #{results}
  EOH
end

ruby_block "Results" do
  only_if { ::File.exists?(results) }
  block do
    print "\n"
    print <<-'HEREDOC'
    _            _                 _               _
   | |_ ___  ___| |_    ___  _   _| |_ _ __  _   _| |_
   | __/ _ \/ __| __|  / _ \| | | | __| '_ \| | | | __|
   | ||  __/\__ \ |_  | (_) | |_| | |_| |_) | |_| | |_
    \__\___||___/\__|  \___/ \__,_|\__| .__/ \__,_|\__|
                                      |_|
    HEREDOC
    print "\n"
    print File.read(results)
  end
end

# NOTES:
# - in this case the inodes are different
#   - chef does not detect the file is hard-linked and copy the source to all hard-links.


### cleanup

execute 'cleanup' do
  command 'rm -rf /tmp/chef_hard_link_test'
end
