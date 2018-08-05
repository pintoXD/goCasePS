module Api
  module V1

    class SurvivorsController < ApplicationController
        #List all survivors, abducted or not.
        def index
            survivors = Survivor.order(:name)
            render json: {status: 'SUCCESS', message:'Survivors database', data: survivors.as_json(only: [:name, :flag])},status: :ok
        end

        #List survivor by id
        def show
          survivor = Suvivor.find(params[:id])
          render json: {status: 'SUCCESS', message:'Survivor founded', data:survivor},status: :ok
        end



        def create

              survivor = Survivor.new(survivor_params)

              if survivor.save
                render json: {status: 'SUCCESS', message:'Added survivor', data:survivor},status: :ok
              else
                render json: {status: 'ERROR', message:'Error at recording', data:survivor.erros},status: :unprocessable_entity
              end

        end


        def update


            survivor = Survivor.find(params[:id])

            if survivor.update_attributes(survivor_params)

              render json: {status: 'SUCCESS', message:'Updated survivor', data:survivor},status: :ok
    				else
    					render json: {status: 'ERROR', message:'Survivor not update', data:survivor.erros},status: :unprocessable_entity
    				end

        end


        def destroy

            survivor = Survivor.find(params[:id])

            survivor.destroy
				    render json: {status: 'SUCCESS', message:'Deleted survivor', data:survivor},status: :ok

        end


        private

        def survivor_params

            params.permit(:name, :age, :gender, :latitude, :longitude, :flag)


        end









      end


  end
end
