class PortfoliosController < ApplicationController
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
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

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
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html {redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        # format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        # format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # performs look up
    @portfolio_item = Portfolio.find(params[:id])

    # deletes the record
    @portfolio_item.destroy

    # redirect
    respond_to do |format|
      format.html {redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

end
