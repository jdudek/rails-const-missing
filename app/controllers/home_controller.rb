class HomeController < ApplicationController
  def index
    @comment = Comment.new
  end
end
