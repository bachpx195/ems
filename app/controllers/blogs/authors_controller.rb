class Blogs::AuthorsController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
