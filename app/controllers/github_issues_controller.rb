class GithubIssuesController < ApplicationController
  before_action :set_github_issue, only: [:show, :edit, :update, :destroy]

  # GET /github_issues
  # GET /github_issues.json
  def index
    @github_issues = GithubIssue.all
  end

  # GET /github_issues/1
  # GET /github_issues/1.json
  def show
  end

  # GET /github_issues/new
  def new
    @github_issue = GithubIssue.new
  end

  # GET /github_issues/1/edit
  def edit
  end

  # POST /github_issues
  # POST /github_issues.json
  def create
    @github_issue = GithubIssue.new(github_issue_params)

    respond_to do |format|
      if @github_issue.save
        format.html { redirect_to @github_issue, notice: 'Github issue was successfully created.' }
        format.json { render :show, status: :created, location: @github_issue }
      else
        format.html { render :new }
        format.json { render json: @github_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /github_issues/1
  # PATCH/PUT /github_issues/1.json
  def update
    respond_to do |format|
      if @github_issue.update(github_issue_params)
        format.html { redirect_to @github_issue, notice: 'Github issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @github_issue }
      else
        format.html { render :edit }
        format.json { render json: @github_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /github_issues/1
  # DELETE /github_issues/1.json
  def destroy
    @github_issue.destroy
    respond_to do |format|
      format.html { redirect_to github_issues_url, notice: 'Github issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_github_issue
      @github_issue = GithubIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def github_issue_params
      params.require(:github_issue).permit(:github_id, :path)
    end
end
