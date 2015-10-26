class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]
  after_action :update_parent, only: [:create, :update]
  after_action :update_position, only: [:create, :update, :reorder]

  def index
    @requirements = Requirement.all
  end

  def show
  end

  def new
    @requirement = Requirement.new(feature_id: params[:feature_id])
    # if params[:feature_id]
    #   @requirement.feature_requirements.build(feature_id: params[:feature_id])
    # end
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

  def reorder
    @requirement ||= Requirement.find(requirement_params['id'])
    head :ok, content_type: "text/html"
  end

  private
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    def update_parent
      @requirement.update_parent(requirement_params['parent_id']) if requirement_params['parent_id']
    end

    def update_position
      @requirement.update_position(requirement_params['position'])
    end

    def requirement_params
      params.require(:requirement)
            .permit(  :id,
                      :title,
                      :summary,
                      :status,
                      :feature_id,
                      :position,
                      :parent_id,
                      # feature_requirements_attributes: [
                      #   :feature_id, :requirement_id
                      # ],
                      requirement_test_cases_attributes: [
                        :requirement_id, :test_case_id
                      ]
                    )
    end
end
