# -*- coding: utf-8 -*-

class BlogsController < ApplicationController
  before_filter :authenticate if Auth.basic_auth
  #before_filter :authenticate_user!

  # GET /blogs
  # GET /blogs.json
  def index
    @search = Blog.search(params[:search], :order => "id DESC")
    @blogs = @search.paginate(:page => params[:page], :order => "id DESC")

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

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Auth.username &&
      password == Auth.password
    end
  end
end

class BootstrapPaginationRenderer < WillPaginate::ActionView::LinkRenderer
  private
  def previous_or_next_page(page, text, classname)
    link(text, page, :class => classname) unless page == false
  end

  public
  def to_html
    html = pagination.map do |item|
      tag(:li,
        ((item.is_a?(Fixnum))?
          page_number(item) :
          send(item)))
    end.join(@options[:link_separator])

    html = tag(:ul, html)

    @options[:container] ? html_container(html) : html
  end
end
