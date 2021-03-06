 class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all_sorted
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic=Topic.find(params[:id]) or raise ActiveRecord::RecordNotFound, "Record not found."
    @topic.posts.build
    unless params[:url].nil? and not @topic.nil?
      if @topic.board.url==params[:url]
        @new_post=Post.new
        @new_post.topic=@topic
        render 'show'
      else
        raise ActiveRecord::RecordNotFound, "Record not found."
      end
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @post=@topic.op
    @topic.save
    @post.user = current_user
    @post.topic=@topic
    @topic.latest_post=@post
    if @topic.save
      url="/"+@topic.board.url+"/"+@topic.id.to_s
        #format.html { redirect_to @topic.url, notice: 'Thread was successfully created.' }
        #format.html { redirect_to @topic, notice: 'Thread was successfully created.' }
        format.html { redirect_to url, notice: 'Thread was successfully created.' }
        #format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        flash[:warning] = @post.errors
        redirect_to "/"+@post.board.url, notice: 'The topic cannot be empty.'
        #format.html { render :new }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :board_id, :url, posts_attributes:[:content, :show_name, :author, :attachment])
    end
    def post_params
      params.require(:post).permit(:topic_id, :content, :user_id, :show_name, :author, :attachment)
    end
  end
