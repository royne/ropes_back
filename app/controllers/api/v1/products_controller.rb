module Api
  module V1
    class ProductsController < ApplicationController
      include Rails.application.routes.url_helpers
      before_action :set_product, only: [:show, :update, :destroy]
    
      # GET /products
      def index
        @products = Product.all
    
        render json: @products
      end
    
      # GET /products/1
      def show
        render json: @product
      end
    
      # POST /products
      def create
        @product = Product.new(product_params)        
        # if @product.save
        #   if Rails.env.production?
        #     result_image = Cloudinary::Uploader.upload(params[:image_file][:image], :folder => "artykrea/") 
        #     @product.update(image_url: result_image['secure_url'])
        #   else  
        #     @product.update(image: params[:image_file][:image])
        #     @product.update(image_url: rails_blob_url(@product.image))  
        #   end
        #   render json: @product, status: :created
        # else
        #   render json: @product.errors, status: :unprocessable_entity
        # end
      end
    
      # PATCH/PUT /products/1
      def update
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
          params.require(:product).permit(:name, :description, :dimension, :category_id)
        end
      
    end
  end
end