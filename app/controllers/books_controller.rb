class BooksController < ApplicationController
  def new
  end

  def create
  	title = params[:book][:title]
  	@book = Book.find_by_title(title)
    @book = Book.new(params[:book]) if @book.nil?
    if @book.save
      #sign_in @user
      flash[:success] = "Book created and saved!"
      current_user.read!(@book)
      redirect_to current_user
    else
      # current_user.read!(@book)
      flash[:failure] = "Book save failed!"
      render :new
    end
  end
end
