require 'open4'
require 'redis'
require 'json'

redis = Redis.new

command = ARGV[0]
redis_key = "job-#{command}"

start_time = Time.now
pid, stdin, stdout, stderr = Open4.popen4(command)
end_time = Time.now
ignored, status = Process::waitpid2 pid
duration_ms = (end_time - start_time) * 1000
job_info = { exit:status.exitstatus, stdout:stdout.read.strip, stderr:stderr.read.strip, pid:pid, duration_ms:duration_ms, time:start_time, user:ENV['USER'], command:command}
redis.lpush(redis_key, job_info.to_json)

# remove entries over 1000
if redis.llen(redis_key) > 1000
  redis.ltrim(redis_key, 0, 999)
end



