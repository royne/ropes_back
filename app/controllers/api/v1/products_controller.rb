module Api
  module V1
    class ProductsController < ApplicationController
      include Rails.application.routes.url_helpers
      before_action :set_product, only: [:update, :destroy]
    
      # GET /products
      def index
        @products = Product.all.includes(:category, :colors)
    
        render json: @products
      end
    
      # GET /products/1
      def show
        product = params[:type_id].present? ? Product.find(params[:id]) : Product.find_by(public_url: params[:id])
        render json: product
      end
    
      # POST /products
      def create
        @product = Product.new(product_params)   
        if params[:product][:photos].present?
          array_photos = []
          params[:product][:photos].each {|x| array_photos.push(x[1])}
          @product.photos = array_photos  
        end
        @product.color_ids = params[:product][:color_ids].split(",") if params[:product][:color_ids].present?
        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /products/1
      def update
        @product.color_ids = params[:product][:color_ids].split(",") if params[:product][:color_ids].present?
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /products/1
      def destroy
        @product.destroy
      end
    
      private
        def set_product
          @product = Product.find(params[:id])
        end
    
        def product_params
          params.require(:product).permit(:name, :description, :dimension, :category_id, :public_url, {:photos => [], :color_ids => []})
        end
      
    end
  end
end