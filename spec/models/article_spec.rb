require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'Should throw error if title length is less than 4 chars' do
    expect { Article.create!(title: 'abc', body: 'something') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'Should throw error if body length is less than 4 chars' do
    expect { Article.create!(title: 'abcde', body: 'som') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'Should throw error if title is missing' do
    expect { Article.create!(body: 'some') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'Should throw error if body is missing' do
    expect { Article.create!(title: 'abcde') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'Should throw error if body is less than 4 chars' do
    expect { Article.create!(title: 'abcde', body: 'som') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'Should create article when title, body and user are valid' do
    User.create!(id: 1, name: 'Test', email: 'test@gmail.com', password: 'test@123')
    expect(Article.create!(title: 'abcd', body: 'something', user_id: 1)).to be_truthy
  end
end
