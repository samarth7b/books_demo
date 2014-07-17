require 'spec_helper'

describe Book do

  #let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @book = Book.new(title: "Lorem ipsum", author: "Shakespeare", genre: "General")
  end
  
  subject { @book }

  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:genre) }

  it { should respond_to(:reverse_reads) }
  it { should respond_to(:readers) }

  it { should be_valid }

  describe "when title is not present" do
    before { @book.title = nil }
    it { should_not be_valid }
  end
end