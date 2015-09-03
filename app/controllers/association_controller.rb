class AssociationController < ApplicationController
  def destroy
    Kernel.const_get(controller_name.classify).find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to(:back, notice: 'Association was successfully destroyed.') }
      format.json { head :no_content }
    end
  end
end
