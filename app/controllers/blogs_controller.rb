# -*- coding: utf-8 -*-

class BlogsController < ApplicationController
  before_filter :authenticate if RailsApp::Application.config.basic_auth
  #before_filter :authenticate_user!

  # GET /blogs
  # GET /blogs.json
  def index
    @search = Blog.search(params[:search], :order => "id DESC")
    @blogs = @search.paginate(:page => params[:page], :order => "id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == RailsApp::Application.config.username &&
      password == RailsApp::Application.config.password
    end
  end
end
