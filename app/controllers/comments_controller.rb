class CommentsController < ApplicationController
  def index
    client = open_new_client
    @comments = client.comments.find_all_by_presentation_id(1)
    @comment_items = @comments[@comments.size-5..@comments.size-1]
  end

  def create
    client = open_new_client
    result = client.comments.create(params[:comment])
    redirect_to :action => :index
  end
  
  private
  
  def open_new_client
    connection = ChattinApi::Connection.new(host: "http://localhost", port: 9292)
    ChattinApi::Client.new(connection)
  end
end
