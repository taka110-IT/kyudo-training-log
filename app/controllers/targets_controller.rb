class TargetsController < ApplicationController
  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)

    respond_to do |format|
      if @target.save
        format.html { redirect_to root_path, notice: "Target was successfully created." }
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
