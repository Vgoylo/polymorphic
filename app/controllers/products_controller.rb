# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    binding.pry

    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:success] = 'Success'
      redirect_to products_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:success] = 'Success'
      redirect_to products_path
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy!
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:success] = 'Success'
      redirect_to products_path
    else
      flash[:error] = 'Error'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
