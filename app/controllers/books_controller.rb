class BooksController < ApplicationController
  def new
  end

  def create
  	title = params[:book][:title]
  	@book = Book.find_by_title(title)
    #@book = Book.new(params[:book]) if @book.nil?

    if @book.nil?
      @book = Book.new(params[:book]) if @book.nil?
      if @book.save
        flash[:success] = "Book created and saved!"
        current_user.read!(@book)
        redirect_to current_user
      else
        flash[:failure] = "Book save failed."
        render :new
      end
    else
      @read = Read.find_by_book_id(@book.id)
      if @read.user_id == current_user.id
        flash[:failure] = "Book already in list of read books!"
        redirect_to current_user
      else
        current_user.read!(@book)
        flash[:success] = "Book added to read books!"
        redirect_to current_user
      end
    end



    #if @book.save
      #sign_in @user
      #flash[:success] = "Book created and saved!"
      #current_user.read!(@book)
      #redirect_to current_user
    #else
      # current_user.read!(@book)
      #flash[:failure] = "Book save failed!"
      #render :new
    #end
  end
end
