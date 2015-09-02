class FeatureRequirementsController < ApplicationController

  def destroy
    FeatureRequirement.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to(:back, notice: 'Association was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

end
