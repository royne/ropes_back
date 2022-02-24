module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:update, :destroy]
    
      # GET /products
      def index
        if params[:parents].present?
          @categories = Category.parents
        else
          @categories = Category.all
        end
    
        render json: @categories
      end
    
      # GET /products/1
      def show
        category = Category.find_by(name: params[:id])
        render json: category
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
          params.require(:category).permit(:name, :image, :parent_category_id)
        end
      
    end
  end
end