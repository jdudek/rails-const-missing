require_dependency "app/models/post"

class HomeController < ApplicationController
  def index
    @comment = Comment.new
  end
end
