worker_processes 2
preload_app true
timeout 30

listen "/tmp/unicorn_hwt.sock", :backlog => 64
pid "/tmp/unicorn_hwt.pid"

stderr_path "./log/unicorn.error.log"
stdout_path "./log/unicorn.out.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
