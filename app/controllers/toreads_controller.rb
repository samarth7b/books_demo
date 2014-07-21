class ToreadsController < ApplicationController

  def new
    @book = Book.new		#instance variable @book
  end

  def create

  end

  def index
    #@users = User.paginate(page: params[:page])
    @toreads = current_user.to_read_books.paginate(page: params[:page])
  end
end
