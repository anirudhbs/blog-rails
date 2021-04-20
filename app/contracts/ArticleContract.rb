module Contract
  class ArticleContract < Dry::Validation::Contract
    params do
      required(:title).filled(:string)
      required(:body).filled(:string)
    end
  end
end
