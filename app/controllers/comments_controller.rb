class CommentsController < ApplicationController

  # GET quotes/:quote_id/comments
  # GET quotes/:quote_id/comments.json
  def index
    # Comment.all is no longer needed, so it's commented out (but left here for reference)
    # @comments = Comment.all

    # Instead, we get the current Quote based on the URL /quotes/:quote_id/commments
    # The model association has_many :comments will allow us to grab all comments index
    # the comments index.html.erb view through the @quote.comments method:

    @quote = Quote.find(params[:quote_id]) # Grab the Quote based on the URL

    # Finally, let's set up a new instance of @comment so that a form appears
    # at the bottom of the comment listing for someone to write a new Comment
    # on the current quote

    @comment = Comment.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # POST quotes/:quote_id/comments
  # POST quotes/:quote_id/comments.json
  def create

    @quote = Quote.find(params[:quote_id]) # Grab the Quote based on the URL

    #@comment = Comment.new(params[:comment])
    @comment = @quote.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to quote_comments_path(@quote), notice: 'Comment was successfully created.' }
        #format.json { render json: @comment, status: :created, location: @comment }
      else
        #format.html { render action: "new" }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE quotes/:quote_id/comments/1
  # DELETE quotes/:quote_id/comments/1.json
  def destroy

    @quote = Quote.find(params[:quote_id]) # Grab the Quote based on the URL

    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to quote_comments_path(@quote) }
      format.json { head :no_content }
    end
  end
end
