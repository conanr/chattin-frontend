class CommentsController < ApplicationController
  def index
    client = open_new_client
    @comment_items = client.comments.find_all_by_presentation_id(1).value
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
