class PracticesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_practice, only: %i[show edit update destroy]
  before_action :set_target, only: %i[index]

  def index
    practices = params[:memos] == 'important' ? Practice.where(important: true) : Practice.all
    @practices = practices.where(user_id: current_user.id).order(fixed: :desc, date: :desc).page(params[:page]).per(10)
    @calendar_displayed_practices = Practice.where(user_id: current_user.id)
  end

  def show; end

  def new
    @practice = Practice.new(date: Time.zone.now)
  end

  def edit; end

  def create
    @practice = Practice.new(practice_params)

    respond_to do |format|
      if @practice.save
        set_target
        update_target_achievement
        format.html { redirect_to practices_path, notice: 'Practice was successfully created.' }
        format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @practice.update(practice_params)
        set_target
        update_target_achievement
        format.html { redirect_to practices_path, notice: 'Practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @practice.destroy

    respond_to do |format|
      set_target
      update_target_achievement
      format.html { redirect_to practices_url, notice: 'Practice was successfully destroyed.', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_practice
    @practice = Practice.find(params[:id])
  end

  def set_target
    start_date = set_start_date
    @target_data = Target.where(year: start_date.year, month: start_date.month, user_id: current_user.id)
    @target = set_target_total
    result(start_date)
  end

  def result(start_date)
    @result = Practice.where(date: start_date.in_time_zone.all_month, user_id: current_user.id).sum(:shooting_count)
    @remaining_to_target = set_remaining_to_target
  end

  def set_start_date
    params.fetch(:start_date, Time.zone.today).to_date
  end

  def set_target_total
    if @target_data.blank?
      '0射'
    else
      "#{@target_data.first[:total]}射"
    end
  end

  def set_remaining_to_target
    return '目標射数が設定されていません' if @target_data.blank?

    remaining_shots = @target_data.first[:total] - @result
    if (remaining_shots <= 0) && (@target_data.first[:achievement] == true)
      '目標を達成しました'
    else
      "残り#{remaining_shots}射"
    end
  end

  def update_target_achievement
    return if @target_data.blank?

    remaining_shots = @target_data.first[:total] - @result
    if (remaining_shots <= 0) && (@target_data.first[:achievement] == false)
      @target_data.first.update(achievement: true)
    elsif remaining_shots.positive? && (@target_data.first[:achievement] == true)
      @target_data.first.update(achievement: false)
    end
  end

  def practice_params
    params.require(:practice).permit(:date, :shooting_count, :memo, :fixed, :important, :user_id)
  end
end
