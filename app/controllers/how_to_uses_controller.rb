# frozen_string_literal: true

class HowToUsesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index; end
end
