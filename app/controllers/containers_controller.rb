class ContainersController < ApplicationController
  before_action :set_container, only: [:show, :edit, :update, :destroy]

  # GET /containers.json
  def index
    @containers = Container.all
    respond_to do |format|
      format.json {}
    end
  end

  # GET /containers/1.json
  def show
    respond_to do |format|
      format.json {}
    end
  end

  # POST /containers.json
  def create
    @container = Container.new(container_params)

    respond_to do |format|
      if @container.save
        format.json { render :show, status: :created, location: @container }
      else
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /containers/1.json
  def update
    respond_to do |format|
      if @container.update(container_params)
        format.json { render :show, status: :ok, location: @container }
      else
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /containers/1.json
  def destroy
    @container.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_container
      @container = Container.find(params[:id])
    end

    def container_params
      params.require(:container).permit(:name)
    end
end
