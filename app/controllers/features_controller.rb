class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy, :reorder]
  after_action :update_position, only: [:update, :reorder, :update, :create]

  def index
    @features = Feature.all
  end

  def show
  end

  def new
    @feature = Feature.new(parent_id: params[:parent_id])
    @feature.feature_requirements.build(requirement_id: params[:requirement_id])
  end

  def edit
  end

  def create
    @feature = Feature.new(feature_params)

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @feature.new_redirect_path, notice: 'Feature was successfully created.' }
        format.json { render :show, status: :created, location: @feature }
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @feature }
      else
        format.html { render :edit }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature.destroy
    @feature.destroy_associations
    respond_to do |format|
      format.html { redirect_to features_url, {notice: 'Feature was successfully destroyed.'} }
      format.json { head :no_content }
    end
  end

  def reorder
    head :ok, content_type: "text/html"
  end

  private

    def set_feature
      @feature = Feature.find(params[:id])
    end

    def update_position
      @feature.update_position(feature_params['position'])
    end

    def feature_params
      params.require(:feature)
            .permit(:title,
                    :summary,
                    :status,
                    :parent_id,
                    :position,
                    feature_requirements_attributes: [
                      :requirement_id, :feature_id
                    ])
    end
end
