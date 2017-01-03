# you can add multiple server to deploy
role :app, %w{ubuntu@server_ipxx.xxx.xx.xxx ubuntu@server_ipxx.xxx.xx.xxx ubuntu@server_ipxx.xxx.xx.xxx}
set :ssh_options, {
   keys: %w(~/.ssh/YourPemFileToLoginToServer.pem),
   forward_agent: false,
   auth_methods: %w(publickey)
 }
set :branch, 'master'
set :stage, :production
set :deploy_to, '/home/ubuntu/{{application_name}}'

# Use this line if you want to use config file from server (not from repository)
# make sure you setup these files in `/home/ubuntu/{{application_name}}/shared/config`
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/settings/production.yml')
