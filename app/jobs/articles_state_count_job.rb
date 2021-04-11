class ArticlesStateCountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'Hello Rails'
  end
end
