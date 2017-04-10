class Post < ActiveRecord::Base
  #serialize :options, HashSerializer
  store_accessor :options, :blog, :github, :twitter

end

