# config/initializers/delayed_job_config.rb
Delayed::Worker.destroy_failed_jobs = false

#Delayed::Worker.sleep_delay = 60
#Delayed::Worker.max_attempts = 3

Delayed::Worker.max_run_time = 5.minutes

# RAILS_ENV=production bin/delayed_job start
# RAILS_ENV=productionbin/delayed_job stop
