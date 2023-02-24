# frozen_string_literal: true

class TargetsController < ApplicationController
  before_action :set_target, only: %i[edit update]

  def new
    @target = Target.new(year: params[:year], month: params[:month])
  end

  def edit; end

  def create
    @target = Target.new(target_params)
    start_date = Target.display_start_date(@target)

    if @target.save
      redirect_to root_path(start_date:), notice: t('controllers.targets.create')
    else
      redirect_to root_path(start_date:), status: :unprocessable_entity, alert: t('controllers.targets.create_error')
    end
  end

  def update
    start_date = Target.display_start_date(@target)
    notice_message = params[:target][:notice] == 'achievement' ? 'achievement' : I18n.t('controllers.targets.update')

    if @target.update(target_params)
      redirect_to root_path(start_date:), notice: notice_message
    else
      redirect_to root_path(start_date:), status: :unprocessable_entity, alert: t('controllers.targets.update_error')
    end
  end

  private

  def set_target
    @target = current_user.targets.find_by(id: params[:id])
  end

  def target_params
    params.require(:target).permit(:total, :year, :month, :user_id, :achievement)
  end
end
