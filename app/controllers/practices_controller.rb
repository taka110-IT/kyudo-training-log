# frozen_string_literal: true

class PracticesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_practice, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      practices = Practice.practices_tab_contents(params[:memos])
      @user_practices = Practice.setting_user_practices(practices, current_user.id).page(params[:page]).per(10)
      @calendar_displayed_practices = Practice.where(user_id: current_user.id)
      start_date = params.fetch(:start_date, Time.zone.today).to_date
      @target_data = Target.setting_target(start_date, current_user.id)
      @results = Practice.setting_results(start_date, current_user.id)
      @remaining_shots = Practice.remaining_to_target(@target_data, @results) if @target_data.present?
      Target.cancel_target_achievement(@target_data, @remaining_shots)
    else
      render template: 'welcome/index'
    end
  end

  def show; end

  def new
    @practice = Practice.new(date: Time.zone.now)
  end

  def edit; end

  def create
    @practice = Practice.new(practice_params)
    start_date = Practice.display_start_date(@practice)

    respond_to do |format|
      if @practice.save
        format.html { redirect_to root_path(start_date:), notice: t('controllers.practices.create') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @practice.update(practice_params)
        start_date = Practice.display_start_date(@practice)
        format.html { redirect_to root_path(start_date:), notice: t('controllers.practices.update') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @practice.destroy
    start_date = Practice.display_start_date(@practice)

    respond_to do |format|
      format.html { redirect_to root_path(start_date:), notice: t('controllers.practices.destroy'), status: :see_other }
    end
  end

  private

  def set_practice
    @practice = Practice.find(params[:id])
  end

  def practice_params
    params.require(:practice).permit(:date, :shooting_count, :memo, :fixed, :important, :user_id)
  end
end
