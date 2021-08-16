module ActsAsResource
  extend ActiveSupport::Concern

  included do
    before_action :set_resource, only: %i[show update destroy]
  end

  # GET /resources
  def index
    render json: serialized_resources
  end

  # GET /resources/1
  def show
    render json: serialized_resource
  end

  # POST /resources
  def create
    @resource = resource_class.new
    @resource.assign_attributes(resource_params)

    if @resource.save
      render json: serialized_resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      render json: serialized_resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
  end

  private

  def resource_class
    @resource_class ||= controller_name.classify.constantize
  end

  def set_resource
    @resource = resource_scope.find_by(id: params[:id])
  end

  def resource_scope
    @resource_scope ||= resource_class
  end

  def resource_params
    params.require(resource_class.model_name.param_key)
          .permit(resource_class.column_names)
  end

  def serialized_resource
    @resource.as_json
  end

  def serialized_resources
    resource_scope.all.as_json
  end
end
