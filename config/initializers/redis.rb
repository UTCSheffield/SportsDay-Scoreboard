REDIS = Redis.new(url:  ENV['REDIS_URL'],
                          port: ENV['REDIS_PORT'],
                          db: 0)