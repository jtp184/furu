class ApplicationController < ActionController::Base
  before_action :require_login

  before_action :paginate, only: [:index]
  before_action :set_model_scope
  before_action :set_resource, only: %i[show edit destroy update]
  before_action :set_resources, only: [:index]

  def index; end

  def show; end

  def new; end

  def edit; end

  def update
    @resource.update!(resource_params)
    redirect_to @resource
  end

  def create
    m = @model.new(resource_params)
    m.save!
    redirect_to m
  end

  def destroy
    @resource.destroy
    redirect_to action: :index
  end

  private

  def set_resource
    @resource = @model.find(url_id_param)
  end

  def set_resources
    @resources = @model.limit(10).offset((@page - 1) * 10)
  end

  def set_model_scope
    @model = controller_name.singularize
                            .camelize
                            .constantize
  end

  def url_id_param
    params.permit(:id)[:id]
  end

  def resource_params
    case controller_name
    when 'recipes'
      params.require(:recipe).permit(:user_id, :title, :description)
    when 'recipe_steps'
      params.require(:recipe_step).permit(:recipe_id, :title, :description, :order)
    when 'users'
      params.require(:user).permit(:username, :password)
    else
      raise ArgumentError
    end
  end

  def paginate
    page_arg = params.permit(:page)[:page]
    @page = if page_arg
              Integer(page_arg)
            else
              1
            end
  end

  def not_authenticated
    redirect_to sign_in_path
  end
end
