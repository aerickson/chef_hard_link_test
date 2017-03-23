### init

directory '/tmp/chef_hard_link_test' do
  mode '0755'
  action :create
end


### test

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

# will it explode?
cookbook_file '/tmp/chef_hard_link_test/foo.txt' do
  source 'foo.txt'
  mode '0755'
  action :create
end


### cleanup

file '/tmp/chef_hard_link_test/foo2.txt' do
  action :delete
end

file '/tmp/chef_hard_link_test/foo.txt' do
  action :delete
end

directory '/tmp/chef_hard_link_test' do
  recursive true
  action :delete
end
