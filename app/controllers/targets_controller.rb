class TargetsController < ApplicationController
  def new
    target_year = params[:year]
    target_month = params[:month]
    @target = Target.new(year: target_year, month: target_month)
  end

  def edit
    @target = Target.find_by(id: params[:id])
  end

  def create
    @target = Target.new(target_params)
    start_date = set_date

    respond_to do |format|
      if @target.save
        format.html { redirect_to root_path(start_date:), notice: t('controllers.targets.create') }
        format.json { render :show, status: :created, location: @target }
      else
        format.html { redirect_to root_path(start_date:), status: :unprocessable_entity, alert: t('controllers.targets.create_error') }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @target = Target.find_by(id: params[:id])
    start_date = set_date
    notice_message = params[:target][:notice] == 'achievement' ? 'achievement' : t('controllers.targets.update')

    respond_to do |format|
      if @target.update(target_params)
        format.html { redirect_to root_path(start_date:), notice: notice_message }
        format.json { render :show, status: :ok, location: @target }
      else
        format.html { redirect_to root_path(start_date:), status: :unprocessable_entity, alert: t('controllers.targets.update_error') }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_date
    [@target[:year], @target[:month], 1].join('-')
  end

  def target_params
    params.require(:target).permit(:total, :year, :month, :user_id, :achievement)
  end
end
