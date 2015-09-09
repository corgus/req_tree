class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]
  before_action :build_features, only: [:edit]

  def index
    @requirements = Requirement.all
  end

  def show
  end

  def new
    @requirement = Requirement.new
    if params[:feature_id]
      @requirement.feature_requirements.build(feature_id: params[:feature_id])
    end
  end

  def edit
  end

  def create
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement.new_redirect_path, notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @requirement.destroy
    @requirement.destroy_associations
    respond_to do |format|
      format.html { redirect_to requirements_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    def build_features
      @requirement.features.build
    end

    def requirement_params
      params.require(:requirement)
            .permit(  :title,
                      :summary,
                      :status,
                      feature_requirements_attributes: [
                        :feature_id, :requirement_id
                      ],
                      requirement_test_cases_attributes: [
                        :requirement_id, :test_case_id
                      ]
                    )
    end
end
