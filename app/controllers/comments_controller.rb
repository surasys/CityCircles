class CommentsController < ApplicationController
  
  before_filter :find_commentable
  before_filter :require_user
  
  def create
      @comment = @commentable.comments.new( params[ :comment ] )
      @comment.author_id = current_user.id
      @comment.save!
      respond_to do |format|
        format.html { redirect_to :back }
      end
    end
  
  private

  def find_commentable
    # Get the class name of the type for which the comment is being created
    klass = params[ :commentable_type ].camelize.constantize
    # Set commentable as an instance variable available to all methods to aid in creating comments for each model that uses commentable.
    @commentable = klass.find( params[ :commentable_id ] )
  end
  
end
