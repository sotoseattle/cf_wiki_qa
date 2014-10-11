class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = current_user.pages.new(page_params)
    if @page.save
      @page.users << current_user
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    @page.users |= [current_user]
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:question, :answer)
  end
end
