user "matt" do
  supports :manage_home => true
  home "/home/matt"
  shell "/bin/bash"
  password ""
  not_if "stat /home/matt"
  notifies :run, "execute[expire-matts-password]", :immediately
end

execute "expire-matts-password" do
  command "chage -d 0 matt"
  action :nothing
end

template node[:farmdawg][:profile][:location] do
  owner "matt"
  group "matt"
  mode "0644"
  action :create
  source "profile.erb"
  variables({
    :using_ubuntu => node[:farmdawg][:profile][:using_ubuntu],
    :using_git => node[:farmdawg][:profile][:using_git]
  })
end
