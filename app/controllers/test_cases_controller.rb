class TestCasesController < ApplicationController
  before_action :set_test_case, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:test_case].try(:[],:query)
    @test_cases = if @query.present?
      TestCase.paginated_search_results(@query, pagination_options)
    else
      TestCase.all.paginate(page: params[:page])
    end
  end

  def show
  end

  def new
    @test_case = TestCase.new
    if params[:requirement_id]
      @test_case.requirement_test_cases.build(requirement_id: params[:requirement_id])
    end
    if params[:test_record_id]
      @test_case.test_case_test_records.build(test_record_id: params[:test_record_id])
    end
  end

  def edit
  end

  def create
    @test_case = TestCase.new(test_case_params)

    respond_to do |format|
      if @test_case.save
        format.html { redirect_to @test_case, notice: 'Test case was successfully created.' }
        format.json { render :show, status: :created, location: @test_case }
      else
        format.html { render :new }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test_case.update(test_case_params)
        format.html { redirect_to @test_case, notice: 'Test case was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_case }
      else
        format.html { render :edit }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test_case.destroy
    respond_to do |format|
      format.html { redirect_to test_cases_url, notice: 'Test case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_case
      @test_case = TestCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_case_params
      params.require(:test_case)
            .permit(  :title,
                      :summary,
                      :manual_process,
                      :automated_test_path,
                      requirement_test_cases_attributes: [
                        :requirement_id, :test_case_id
                      ],
                      test_case_test_records_attributes: [
                        :test_case_id, :test_record_id
                      ]
                    )
    end
end
