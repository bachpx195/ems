class Admin::BlogsController < Admin::BaseAdminController
  before_action :set_ransack_object, only: [:index, :update]
  before_action :convert_integer_parmas, only: [:create]
  before_action :find_blog, only: [:update]

  def index
    result = @q.result(distinct: true)
    if params.has_key? :sort_by
      result = result.send "sort_by_#{params[:sort_by]}"
    end
    @blogs = result.page(params[:page]).per(20)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new blog_params
    if @blog.save
      flash[:success] = t "created successfully"
      redirect_to admin_blogs_path
    else
      @blog.valid?
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.stop_public_blog
      respond_to do |format|
        result = @q.result(distinct: true)
        if params.has_key? :sort_by && !params[:sort_by].nil?
          result = result.send "sort_by_#{params[:sort_by]}"
        end
        @blogs = result.page(params[:page]).per(20)
        flash[:success] = t "created successfully"
        format.js{render layout: false}
      end
    end
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit Blog::BLOG_ATTRS
  end

  def convert_integer_parmas
    params[:blog][:public_status] = params[:blog][:public_status]
      .to_i
    params[:blog][:suggest_status] = params[:blog][:suggest_status]
      .to_i
  end

  def find_blog
    @blog = Blog.find_by id: params[:id]
    unless @blog
      flash[:danger] = t "errors.blog_not_found"
      redirect_to root_url
    end
  end

  def set_ransack_object
    @q = Blog.ransack params[:q]
  end


end
