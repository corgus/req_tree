class TestRecordsController < ApplicationController
  before_action :set_test_record, only: [:show, :edit, :update, :destroy]

  # GET /test_records
  # GET /test_records.json
  def index
    @test_records = TestRecord.all
  end

  # GET /test_records/1
  # GET /test_records/1.json
  def show
  end

  # GET /test_records/new
  def new
    @test_record = TestRecord.new
  end

  # GET /test_records/1/edit
  def edit
  end

  # POST /test_records
  # POST /test_records.json
  def create
    @test_record = TestRecord.new(test_record_params)

    respond_to do |format|
      if @test_record.save
        format.html { redirect_to @test_record, notice: 'Test record was successfully created.' }
        format.json { render :show, status: :created, location: @test_record }
      else
        format.html { render :new }
        format.json { render json: @test_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_records/1
  # PATCH/PUT /test_records/1.json
  def update
    respond_to do |format|
      if @test_record.update(test_record_params)
        format.html { redirect_to @test_record, notice: 'Test record was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_record }
      else
        format.html { render :edit }
        format.json { render json: @test_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_records/1
  # DELETE /test_records/1.json
  def destroy
    @test_record.destroy
    respond_to do |format|
      format.html { redirect_to test_records_url, notice: 'Test record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_record
      @test_record = TestRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_record_params
      params.require(:test_record).permit(:status, :timestamp, :server)
    end
end
