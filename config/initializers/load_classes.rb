ActionDispatch::Callbacks.before do
  require_dependency "app/models/post"
  require_dependency "app/controllers/posts_controller"
end
