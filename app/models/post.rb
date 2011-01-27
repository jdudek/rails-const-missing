class Post
end

class Comment
  @@counter ||= 0
  @@counter += 1
  cattr_reader :counter

  def version
    1
  end
end
