class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :destroy, :show]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.all
    # @portfolio_items = Portfolio.angular
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Latest post is live.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html {redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        # format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        # format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    # binding.pry
  end

  def destroy
    # performs look up

    # deletes the record
    @portfolio_item.destroy

    # redirect
    respond_to do |format|
      format.html {redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private 

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
