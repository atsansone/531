class CommentsController < ApplicationController

  # Use a before_filter to find the current quote; actual method is private,
  # and defined at the bottom of this file. The current quote is always found
  # before any of the actions on the controller run.
  #
  # See http://guides.rubyonrails.org/action_controller_overview.html#filters

  before_filter :find_current_quote

  # GET quotes/:quote_id/comments
  # GET quotes/:quote_id/comments.json
  def index

    # Set up a new instance of @comment so that a form appears
    # at the bottom of the comment listing for someone to write
    # a new Comment on the current quote:

    @comment = Comment.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # POST quotes/:quote_id/comments
  # POST quotes/:quote_id/comments.json
  def create

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

    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to quote_comments_path(@quote) }
      format.json { head :no_content }
    end
  end

  private

  def find_current_quote
    @quote = Quote.find(params[:quote_id]) # Grab the Quote based on the URL
  end

end
