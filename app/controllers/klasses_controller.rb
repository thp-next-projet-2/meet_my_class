# frozen_string_literal: true

class KlassesController < ApplicationController

    before_action :authenticate_student!

    def index
        @klass = Klass.last
    end

    def show
        @klass = Klass.find(params[:id])
    end
end
