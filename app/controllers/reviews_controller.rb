class ReviewsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def new
    @review = Review.new
  end
  
  def create
    @review = current_user.reviews.build(params[:review])

    @book = Book.find_by_title(@review.book_title)
    if @book.nil?
      @book = Book.new(title: @review.book_title, author: "", genre: "")
      if @book.save
        flash[:success] = "Book created and saved!"
        current_user.read!(@book)
        if @review.save
          flash[:success] = "Review successfully added!"
          redirect_to current_user
        else
          flash[:failure] = "Review could not be saved."
          redirect_to current_user
        end
      else
        flash[:failure] = "Book save failed."
        redirect_to current_user
      end
    else
      @read_book = current_user.read_books.find_by_title(@review.book_title)
      if @read_book.nil?
        current_user.read!(@book)
      end
      if @review.save
        flash[:success] = "Review successfully added!"
        redirect_to current_user
      else
        flash[:failure] = "Review could not be saved."
        redirect_to current_user
      end
    end
  end
    

    #@book = current_user.read_books.find_by_title(@review.book_title)
    #if @book.nil?
      #@book = Book.new(title: params[:review][:book_title], author: "", genre: "")
      #@book.save
      #current_user.read!(@book)
    #end
    #if @review.save
      #flash[:success] = "Review created!"
      #redirect_to root_url
    #else
      #@feed_items = []
      #render 'static_pages/home'
    #end
  #end

  def destroy
    @review.destroy
    redirect_to root_url
  end

  private
  
    def correct_user
      @review = current_user.reviews.find_by_id(params[:id])
      redirect_to root_url if @review.nil?
    end
end