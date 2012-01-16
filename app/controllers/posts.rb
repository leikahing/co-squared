CoSquared.controllers :posts do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index do
    #@posts = Post.all(:order => 'created_at desc')
    @posts = Post.all(:order => [ :created_at.desc ])
    render 'posts/index'
  end

  get :show, :with => :id do
    @post = Post.get(params[:id])
    render 'posts/show'
  end

  get :new do
    @post = Post.new
    render 'posts/new'
  end

  post :new do
    @post = Post.new(params[:post])
    if @post.save
      redirect url_for(:posts, :index)
    else
      render 'posts/new'
    end
  end

end
