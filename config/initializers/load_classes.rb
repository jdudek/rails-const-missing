require Rails.root.join "lib", "custom_const_missing"
CustomConstMissing.hook!
CustomConstMissing.map :Comment, "app/models/post"
CustomConstMissing.map :CommentsController, "app/controllers/posts_controller"
