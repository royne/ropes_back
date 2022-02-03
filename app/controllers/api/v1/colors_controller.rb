module Api
  module V1
    class ColorsController < ApplicationController
      before_action :set_color, only: [:show, :update, :destroy]
    
      # GET /products
      def index
        @colors = Color.all
    
        render json: @colors
      end
    
      # GET /products/1
      def show
        render json: @color
      end
    
      # POST /products
      def create
        @color = Color.new(color_params)        
        if @color.save
          render json: @color, status: :created
        else
          render json: @color.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /products/1
      def update
        if @color.update(color_params)
          render json: @color
        else
          render json: @color.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /products/1
      def destroy
        @color.destroy
      end
    
      private
        def set_color
          @color = Color.find(params[:id])
        end
    
        def color_params
          params.require(:color).permit(:name)
        end
      
    end
  end
end