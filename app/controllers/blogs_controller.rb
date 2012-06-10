# -*- coding: utf-8 -*-

class BlogsController < ApplicationController
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

class BootstrapPaginationRenderer < WillPaginate::ActionView::LinkRenderer
  private
  def previous_or_next_page(page, text, classname)
    link(text, page, :class => classname)
  end

  public
  # method as you see fit.
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
