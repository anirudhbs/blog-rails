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

  it 'Should create article when title and body are valid' do
    expect(Article.create!(title: 'abcd', body: 'something')).to be_truthy
  end
end
