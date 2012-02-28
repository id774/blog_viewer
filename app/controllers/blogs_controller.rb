# -*- coding: utf-8 -*-

class BlogsController < ApplicationController
  #before_filter :authenticate_user!

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.scoped(:order => "id DESC").page(params[:page]).per(1000)

    unless params[:uid].nil?
      @blogs = @blogs.where(:uid => params[:uid])
    end
    unless params[:screen_name].nil?
      @blogs = @blogs.where(:screen_name => params[:screen_name])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blogs.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:status])
        format.html { redirect_to edit_blog_path(@blog), notice: 'blog was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, blog: :unprocessable_entity }
      end
    end
  end
end
