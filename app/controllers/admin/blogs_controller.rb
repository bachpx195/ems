class Admin::BlogsController < Admin::BaseAdminController
  before_action :set_ransack_object, only: [:index]
  before_action :convert_integer_parmas, only: [:create, :update, :confirm]
  before_action :find_blog, only: [:update, :edit, :destroy]

  def index
    result = @q.result(distinct: true)
    if params.has_key?(:sort_by) && !params[:sort_by].blank?
      result = result.send "sort_by_#{params[:sort_by]}"
    end
    @blogs = result.includes(:category).page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.js{render layout: false}
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new blog_params
    if @blog.save
      @type_action = params[:type_action]
      redirect_to confirm_admin_blogs_path(id: @blog.id, type: "create")
    else
      @blog.valid?
      render :new
    end
  end

  def edit
  end

  def update
    @blog.stop_public_blog if params[:type] == "stop_public"
    @blog.public_blog if params[:type] == "public_blog"
    @blog.update_attribute("public_time", params[:blog]["public_time"]) if params[:type] == "change_time"

    respond_to do |format|
      format.js{render layout: false}
      format.html do
        if @blog.update_attributes blog_params
          @type_action = params[:type_action]
          redirect_to confirm_admin_blogs_path(id: @blog.id, type: "update")
        else
          @blog.valid?
          render :edit
        end
      end
    end
  end

  def destroy
    if @blog.destroy
      flash[:success] = t "alert.blog.delete"
    end
    redirect_to admin_blogs_path
  end

  def confirm
    @blog = Blog.find_by id: params[:id] if params.has_key?(:id)
    if params[:type_action] == "update"
      flash[:success] = t "alert.blog.update"
      redirect_to admin_blogs_path
    end
    if params[:type_action] == "create"
      flash[:success] = t "alert.blog.create"
      redirect_to admin_blogs_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit Blog::BLOG_ATTRS
  end

  def convert_integer_parmas
    if params[:blog]
      params[:blog][:public_status] = params[:blog][:public_status]
        .to_i
      params[:blog][:suggest_status] = params[:blog][:suggest_status]
        .to_i
    end
  end

  def find_blog
    @blog = Blog.find_by id: params[:id]
    unless @blog
      redirect_to root_url
    end
  end

  def set_ransack_object
    @q = Blog.ransack params[:q]
  end
end
