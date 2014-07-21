class BooksController < ApplicationController
  def new
  end

  def create
  	title = params[:book][:title]
  	@book = Book.find_by_title(title)
    #@book = Book.new(params[:book]) if @book.nil?

    if @book.nil?
      @book = Book.new(title: params[:book][:title], author: params[:book][:author], genre: params[:book][:genre])
      if @book.save
        flash[:success] = "Book created and saved!"
        if params[:book][:source] == "reads"
          current_user.read!(@book)
        else
          if params[:book][:source] == "toreads"
            current_user.toread!(@book)
          end
        end
        redirect_to current_user
      else
        flash[:failure] = "Book save failed."
        #render :new
        redirect_to current_user
      end
    else
      if params[:book][:source] == "reads"
        @read = Read.find_by_book_id(@book.id)
        if @read.nil?
          current_user.read!(@book)
          flash[:success] = "Book added to read books!"
          redirect_to current_user
        else
          if @read.user_id == current_user.id
            flash[:failure] = "Book already in list of read books!"
            redirect_to current_user
          else
            current_user.read!(@book)
            flash[:success] = "Book added to read books!"
            redirect_to current_user
          end
        end
      else
        if params[:book][:source] == "toreads"
          @toread = Toread.find_by_book_id(@book.id)
          if @toread.nil?
            current_user.toread!(@book)
            flash[:success] = "Book added to 'To-Read' list!"
            redirect_to current_user
          else
            if @toread.user_id == current_user.id
              flash[:failure] = "Book already in 'To-Read' list!"
              redirect_to current_user
            else
              current_user.toread!(@book)
              flash[:success] = "Book added to 'To-Read' list!"
              redirect_to current_user
            end
          end
        end
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
