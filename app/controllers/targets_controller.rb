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

    respond_to do |format|
      if @target.save
        format.html { redirect_to root_path, notice: t('controllers.targets.create') }
        format.json { render :show, status: :created, location: @target }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @target = Target.find_by(id: params[:id])

    respond_to do |format|
      if @target.update(target_params)
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @target }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def target_params
    params.require(:target).permit(:total, :year, :month, :user_id, :achievement)
  end
end
