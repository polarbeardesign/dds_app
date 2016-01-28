class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index

    require 'will_paginate/array'
    @posts = Post.ordered.paginate :page => params[:page], :per_page => 10
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = current_user
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @categories = Category.find(:all)
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @categories = Category.find(:all)
    @user = current_user
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    @categories = Category.find(:all)

    checked_categories = []
    checked_params = params[:category_list] || []
    for check_box_id in checked_params
      category = Category.find(check_box_id)
      if not @post.categories.include?(category)
        @post.categories << category
      end
      checked_categories << category
    end


    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Blog post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

     @categories = Category.find(:all)

    checked_categories = []
    checked_params = params[:category_list] || []
    for check_box_id in checked_params
      category = Category.find(check_box_id)
      if not @post.categories.include?(category)
        @post.categories << category
      end
      checked_categories << category
    end
    missing_categories = @categories - checked_categories
    for category in missing_categories
      if @post.categories.include?(category)
        @post.categories.delete(category)
      end
    end


    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Blog post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
