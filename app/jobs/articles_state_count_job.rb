class ArticlesStateCountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Drafted articles::#{Article.draft.count}"
    puts "Submitted articles::#{Article.submit.count}"
    puts "Published articles::#{Article.publish.count}"
  end
end
