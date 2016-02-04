class SafetyItemVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_safety_item_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    safety_item = @version.reify
    safety_item.save
    redirect_to edit_safety_item_path(@safety_item)
  end

  private

    def set_safety_item_and_version
      @safety_item = SafetyItem.find(params[:safety_item_id])
      @version = @safety_item.versions.find(params[:id])
    end


end