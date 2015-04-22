require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) {FactoryGirl.create :category}

  subject {category}

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is not valid" do
      before {subject.name = ""}
      it {is_expected.not_to be_valid}
    end

    context "when name is too long" do
      before {subject.name = Faker::Lorem.characters(55)}
      it {is_expected.not_to be_valid}
    end
  end

  describe "relation test" do

    context "valid word" do
      before do
        category.words.build FactoryGirl.attributes_for :word
      end
      subject {category.save}
      it {is_expected.to be_truthy}
    end

    context "valid muntiple words" do
      before do
        category.words.build FactoryGirl.attributes_for :word
        category.words.build FactoryGirl.attributes_for :word
        category.words.build FactoryGirl.attributes_for :word
      end
      subject {category.save}
      it {is_expected.to be_truthy}
    end

    context "count words of category" do
      before do
        category.words.build FactoryGirl.attributes_for :word
        category.words.build FactoryGirl.attributes_for :word
        category.words.build FactoryGirl.attributes_for :word
        category.save
      end
      subject {category.words.count}
      it {is_expected.to eq 3}
    end
  end
end
