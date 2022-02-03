module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]
    
      # GET /products
      def index
        @categories = Category.all
    
        render json: @categories
      end
    
      # GET /products/1
      def show
        render json: @category
      end
    
      # POST /products
      def create
        @category = Category.new(category_params)        
        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /products/1
      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /products/1
      def destroy
        @category.destroy
      end
    
      private
        def set_category
          @category = Category.find(params[:id])
        end
    
        def category_params
          params.require(:category).permit(:name)
        end
      
    end
  end
end