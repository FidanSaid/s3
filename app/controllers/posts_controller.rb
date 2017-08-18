class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show 
      @post = Post.find(params[:id])

    # send_file "#{Rails.root}/public#{@post.image.url}"
  
  end

  def download
    post = Post.find(params[:id])
    file_original_url = post.image.url
    system("wget #{file_original_url} -P #{Rails.root}/tmp")
    render json: {status: 'ok', file_url: file_original_url}      
  end


  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.mirror_image = @post.image
    @post.original_file_name =  File.basename(@post.image.url) 
    @post.generated_file_name = generat_file_name( @post.original_file_name)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
     else    
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

 



  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
def generat_file_name(file_name)
    x = [(0..9), ('A'..'Z')].map(&:to_a).flatten
    digt = (0...5).map { x[rand(x.length)] }.join
    return digt + file_name
end



    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :mirror_image, :description, :unique_key, :generate_file_name)
    end
end




