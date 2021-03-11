class PostVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_post_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    post = @version.reify
    post.save
    redirect_to edit_post_path(@post)
  end

  private

    def set_post_and_version
      @post = Post.find(params[:post_id])
      @version = @post.versions.find(params[:id])
    end


end