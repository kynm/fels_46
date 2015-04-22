require 'rails_helper'

RSpec.describe Word, type: :model do
  let(:word) {FactoryGirl.create :word}
  let(:other_word) {FactoryGirl.create :word}
  let(:category) {FactoryGirl.create :category}

  subject {word}

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "when content is not valid" do
      before {subject.content = ""}
      it {is_expected.not_to be_valid}
    end

    context "when content is not uniqueness in category" do
      before do
        word.category_id = category.id
        word.save
        other_word.content = word.content
        other_word.category_id = category.id
      end
      subject {other_word}
      it {is_expected.not_to be_valid}
    end
  end

  describe "relation test" do

    context "valid answer" do
      before do
        word.answers.build FactoryGirl.attributes_for :answer
      end
      subject {word.save}
      it {is_expected.to be_truthy}
    end

    context "valid muntiple answer" do
      before do
        word.answers.build FactoryGirl.attributes_for :answer
        word.answers.build FactoryGirl.attributes_for :answer
        word.answers.build FactoryGirl.attributes_for :answer, correct: true
      end
      subject {word.save}
      it {is_expected.to be_truthy}
    end

    context "count answers of word" do
      before do
        word.answers.build FactoryGirl.attributes_for :answer
        word.answers.build FactoryGirl.attributes_for :answer
        word.answers.build FactoryGirl.attributes_for :answer, correct: true
        word.save
      end
      subject {word.answers.count}
      it {is_expected.to eq 3}
    end
  end
end
