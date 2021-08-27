class Api::V1::PlayersController < ApplicationController

    def create
        customer = Customer.find_or_create_by(customer_params)
        if customer.save
            render({json: customer, except: [:created_at, :updated_at]})
        else
            render json: customer.errors, status: :unprocessable_entity
        end
    end
  
    def customer_params
        params.require(:player).permit(:username, :email)
    end

end