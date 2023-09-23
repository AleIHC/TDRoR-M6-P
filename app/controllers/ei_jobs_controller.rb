class EiJobsController < ApplicationController
  before_action :set_ei_job, only: %i[ show edit update destroy ]
  before_action :authenticate_ei_user!, except: %i[ index ]
  before_action only: [:new, :create] do
    authorize_request(["ei_admin"])
  end

  # GET /ei_jobs or /ei_jobs.json
  def index
    @ei_jobs = EiJob.all
  end

  # GET /ei_jobs/1 or /ei_jobs/1.json
  def show
  end

  # GET /ei_jobs/new
  def new
    @ei_job = EiJob.new
  end

  # GET /ei_jobs/1/edit
  def edit
  end

  # POST /ei_jobs or /ei_jobs.json
  def create
    @ei_job = EiJob.new(ei_job_params)
    @ei_job.ei_user = current_ei_user

    respond_to do |format|
      if @ei_job.save
        format.html { redirect_to ei_jobs_url, notice: "Ei job was successfully created." }
        format.json { render :show, status: :created, location: @ei_job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ei_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ei_jobs/1 or /ei_jobs/1.json
  def update
    respond_to do |format|
      if @ei_job.update(ei_job_params)
        format.html { redirect_to ei_job_url(@ei_job), notice: "Ei job was successfully updated." }
        format.json { render :show, status: :ok, location: @ei_job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ei_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ei_jobs/1 or /ei_jobs/1.json
  def destroy
    @ei_job.destroy

    respond_to do |format|
      format.html { redirect_to ei_jobs_url, notice: "Ei job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ei_job
      @ei_job = EiJob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ei_job_params
      params.require(:ei_job).permit(:ei_user_id, :position, :job_description, :salary, :deadline)
    end
end
