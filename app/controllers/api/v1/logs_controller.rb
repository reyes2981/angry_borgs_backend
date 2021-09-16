class Api::V1::LogsController < ApplicationController
    def index
        logs = Log.all
        render json: LogsSerializer.new(logs)
    end
end
