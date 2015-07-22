module  Api
  module V1
    class ArtsController < ApplicationController
      respond_to :json

      def index
        respond_with Art.all
      end

      def show
        respond_with Art.find(params[:id])
      end

      def create
        respond_with Art.create(params[:art])
      end

      def update
        respond_with Art.update(params[:id], params[:art])
      end

      def destroy
        respond_with Art.destroy(params[:id])
      end

    end
  end
end
