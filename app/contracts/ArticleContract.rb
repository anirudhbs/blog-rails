module Contract
  class ArticleContract < Dry::Validation::Contract
    params do
      required(:title).value(:string, min_size?: 4)
      required(:body).value(:string, min_size?: 4)
    end
  end
end
