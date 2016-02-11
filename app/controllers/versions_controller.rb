class VersionsController < ApplicationController


  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_document_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    member = @version.reify
    member.save
    redirect_to edit_member_path(member)
  end

  private

    def set_document_and_version
      @member = Member.find(params[:member_id])
      @version = @member.versions.find(params[:id])
    end

end
