# frozen_string_literal: true

class TargetsController < ApplicationController
  before_action :set_target, only: %i[edit update]

  def new
    target_year = params[:year]
    target_month = params[:month]
    @target = Target.new(year: target_year, month: target_month)
  end

  def edit; end

  def create
    @target = Target.new(target_params)
    start_date = Target.display_start_date(@target)

    respond_to do |format|
      if @target.save
        format.html { redirect_to root_path(start_date:), notice: t('controllers.targets.create') }
      else
        format.html { redirect_to root_path(start_date:), status: :unprocessable_entity, alert: t('controllers.targets.create_error') }
      end
    end
  end

  def update
    start_date = Target.display_start_date(@target)
    notice_message = Target.display_notice_message(params[:target][:notice])

    respond_to do |format|
      if @target.update(target_params)
        format.html { redirect_to root_path(start_date:), notice: notice_message }
      else
        format.html { redirect_to root_path(start_date:), status: :unprocessable_entity, alert: t('controllers.targets.update_error') }
      end
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
