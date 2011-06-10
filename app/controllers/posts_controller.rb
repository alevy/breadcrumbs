class PostsController < ApplicationController
  before_filter :authenticate!, :except => [:index, :show]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.limit(10)

    respond_to do |format|
      format.html # index.html.erb
      format.rss
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    if (@post.checkin_id = params[:checkin_id])
      @post.trip_id = @post.checkin.trip_id
    else
      @post.trip_id = params[:trip_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    
    if params[:preview]
      @post.valid?
    end
    
    respond_to do |format|
      if not params[:preview] and @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    if params[:preview]
      @post.valid?
    end

    respond_to do |format|
      if not params[:preview] and @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
