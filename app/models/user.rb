# gives User model authentication methods via bcyrpt
class User < ActiveRecord::Base
  has_secure_password
end
