class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end 
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end 
  
   def show
    @user = User.find(params[:id])
   end 
    
    private
    
    def book_params
      params.require(:book).permit(:title, :opinion, :user_id)
    end 
  
end
