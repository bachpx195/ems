class Admin::BlogsController < Admin::BaseAdminController
  before_action :set_ransack_object, only: [:index]
  before_action :convert_integer_parmas, only: [:create, :update, :confirm_post]
  before_action :convert_integer_parmas_confirm, only: [:confirm]
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
    if params[:action_type] == "create"
      @blog.intro_image = File.open(params[:image_path].to_s)
      if params[:commit] == t("admin.blog.create.form.back")
        render :new
      elsif params[:commit] == t("admin.blog.create.form.save")
        @blog.save
        @blog.check_public
        flash[:success] = t "alert.blog.create"
        redirect_to admin_blogs_path
      end
    else
      if @blog.valid?
        @image_path = @blog.intro_image.path
        @action = "create"
        render :confirm
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    @blog.stop_public_blog if params[:type] == "stop_public"
    @blog.public_blog if params[:type] == "public_blog"
    if params[:type] == "change_time"
      @blog.update_attribute "public_time", params[:blog]["public_time"]
      @blog.check_public
    end
    respond_to do |format|
      format.js{render layout: false}
      format.html do
        if params[:action_type] == "update"
          if params[:commit] == t("admin.blog.create.form.back")
            id = @blog.id
            intro_image = @blog.intro_image
            @blog = Blog.new blog_params
            @blog.id = id
            @blog.intro_image = File.open(params[:image_path].to_s)
            render :edit
          elsif params[:commit] == t("admin.blog.create.form.save")
            @blog.update_attributes blog_params
            @blog.update intro_image: File.open(params[:image_path].to_s)
            flash[:success] = t "alert.blog.update"
            redirect_to admin_blogs_path
          end
        else
          if params[:blog][:intro_image].nil?
            @blog_instane = Blog.new(blog_params.merge(intro_image: @blog.intro_image))
          else
            @blog_instane = Blog.new blog_params
          end
          if @blog_instane.valid?
            @action = "update"
            render :confirm
          else
            @blog.update_attributes blog_params
            render :edit
          end
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
    @blog = Blog.new blog_params
  end

  private
  def blog_params
    params.require(:blog).permit Blog::BLOG_ATTRS
  end

  def convert_integer_parmas
    if params[:blog]
      params[:blog][:set_public] = params[:blog][:set_public]
        .to_i
      params[:blog][:suggest_status] = params[:blog][:suggest_status]
        .to_i
    end
  end

  def convert_integer_parmas_confirm
    params[:set_public] = params[:set_public].to_i
    params[:suggest_status] = params[:suggest_status].to_i
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
