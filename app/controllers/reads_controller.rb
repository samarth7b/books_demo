class ReadsController < ApplicationController

  def new
    @book = Book.new
  end

  def create

  end

  def index
    #@users = User.paginate(page: params[:page])
    @reads = current_user.read_books.paginate(page: params[:page])
  end
end
