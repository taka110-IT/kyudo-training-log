class PracticesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_practice, only: %i[ show edit update destroy ]

  # GET /practices or /practices.json
  def index
    practices = params[:memos] == 'important' ? Practice.where(important: true) : Practice.all
    @practices = practices.where(user_id: current_user.id).order(fixed: :desc, date: :desc).page(params[:page]).per(10)
    @calendar_displayed_practices = Practice.where(user_id: current_user.id)
    start_date = params.fetch(:start_date, Date.today).to_date
    @targets = Target.where(year: start_date.year, month: start_date.month, user_id: current_user.id).sum(:total)
    @results = Practice.where(date: start_date.in_time_zone.all_month, user_id: current_user.id).sum(:shooting_count)
    @remaining_shooting_counts = calculate_remaining_shots
  end

  # GET /practices/1 or /practices/1.json
  def show
  end

  # GET /practices/new
  def new
    @practice = Practice.new(date: Time.now)
  end

  # GET /practices/1/edit
  def edit
  end

  # POST /practices or /practices.json
  def create
    @practice = Practice.new(practice_params)

    respond_to do |format|
      if @practice.save
        format.html { redirect_to practices_path, notice: "Practice was successfully created." }
        format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practices/1 or /practices/1.json
  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to practices_path, notice: "Practice was successfully updated." }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1 or /practices/1.json
  def destroy
    @practice.destroy

    respond_to do |format|
      format.html { redirect_to practices_url, notice: "Practice was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_practice
    @practice = Practice.find(params[:id])
  end

  def calculate_remaining_shots
    remaining_shots = @targets - @results
    if @targets.zero?
      '目標射数が設定されていません'
    elsif remaining_shots <= 0
      '目標を達成しました'
    else
      "残り#{remaining_shots}射"
    end
  end

  # Only allow a list of trusted parameters through.
  def practice_params
    params.require(:practice).permit(:date, :shooting_count, :memo, :fixed, :important, :user_id)
  end
end
