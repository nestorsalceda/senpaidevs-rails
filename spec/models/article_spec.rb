require 'spec_helper'

describe Article do
  let(:expected_title) { 'dummy title' }
  let(:expected_text) { 'dummy body' }
  let(:dummy_article) { Article.create(title: expected_title, text: expected_text) }

  it('has title') do
    expect(dummy_article).to respond_to(:title)
  end

  it('has text') do
    expect(dummy_article).to respond_to(:text)
  end

  describe 'validators' do
    it 'title is required' do
      wrong_article = Article.create(text: expected_title)
      expect(wrong_article.valid?).to be_false
      expect(wrong_article.errors).to include(:title)
    end
  end

end
