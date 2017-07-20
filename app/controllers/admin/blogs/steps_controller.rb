class Admin::Blogs::StepsController < Admin::BaseAdminController
  include Wicked::Wizard

  before_action :find_blog, only: [:show]

  steps :confirm
  
  def show
  end

  def update
    if params[:type_action] == "update"
      flash[:success] = t "created successfully"
    else
      flash[:success] = t "created successfully"
    end
    redirect_to admin_blogs_path
  end

  private
  def find_blog
    @blog = Blog.find_by id: params[:blog_id]
    unless @blog
      flash[:danger] = t "errors.blog_not_found"
      redirect_to root_url
    end
  end
end
