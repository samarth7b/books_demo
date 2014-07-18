require 'spec_helper'

describe Read do

  let(:reader) { FactoryGirl.create(:user) }
  let(:read_book) { FactoryGirl.create(:user) }
  let(:read) { reader.reads.build(book_id: read_book.id) }

  subject { read }

  it { should be_valid }

  #describe "accessible attributes" do
  #  it "should not allow access to follower_id" do
  #    expect do
  #      Relationship.new(follower_id: follower.id)
  #    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  #  end
  #end

  describe "reading book methods" do
    it { should respond_to(:reader) }
    it { should respond_to(:read_book) }
    its(:reader) { should == reader }
    its(:read_book) { should == read_book }
  end

  describe "when book id is not present" do
    before { read.book_id = nil }
    it { should_not be_valid }
  end

  describe "when user id is not present" do
    before { read.user_id = nil }
    it { should_not be_valid }
  end
end
