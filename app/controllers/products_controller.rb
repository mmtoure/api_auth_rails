class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: {
      products: @products
    }
  end

  def show
    @product = Product.find(params[:id])
    render json: {
      product: @product
    }
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: {
        status: "Product created",
        products: @product
      }
    else
      render json: {
        status: { message: "Product couldn't be created successfully. #{@product.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: {
        status: "Product updated",
        products: @product
      }
    else
      render json: {
        status: { message: "Product couldn't be updated successfully. #{@product.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: {
        status: "Product deleted"
      }
    else
      render json: {
        status: { message: "Product couldn't be deleted successfully. #{@product.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  private
  def product_params
    params.expect(product: [ :name, :description, :price, :stock ])
  end
end
