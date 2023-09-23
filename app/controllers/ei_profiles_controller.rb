class EiProfilesController < ApplicationController
  before_action :set_ei_profile, only: %i[ show edit update destroy ]

  # GET /ei_profiles or /ei_profiles.json
  def index
    @ei_profiles = EiProfile.all
  end

  # GET /ei_profiles/1 or /ei_profiles/1.json
  def show
    @ei_profile = EiProfile.find(params[:id])
  end

  # GET /ei_profiles/new
  def new
    @ei_profile = EiProfile.new
  end

  # GET /ei_profiles/1/edit
  def edit
  end

  # POST /ei_profiles or /ei_profiles.json
  def create
    @ei_profile = EiProfile.new(ei_profile_params)
    @ei_profile.ei_user = current_ei_user
    @ei_profile.profile_picture.attach(params[:ei_profile][:profile_picture])

    respond_to do |format|
      if @ei_profile.save
        format.html { redirect_to ei_profile_url(@ei_profile), notice: "Ei profile was successfully created." }
        format.json { render :show, status: :created, location: @ei_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ei_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ei_profiles/1 or /ei_profiles/1.json
  def update
    respond_to do |format|
      if @ei_profile.update(ei_profile_params)
        format.html { redirect_to ei_profile_url(@ei_profile), notice: "Ei profile was successfully updated." }
        format.json { render :show, status: :ok, location: @ei_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ei_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ei_profiles/1 or /ei_profiles/1.json
  def destroy
    @ei_profile.destroy

    respond_to do |format|
      format.html { redirect_to ei_profiles_url, notice: "Ei profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ei_profile
      @ei_profile = EiProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ei_profile_params
      params.require(:ei_profile).permit(:ei_user_id, :first_name, :last_name, :email, :phone_number, :current_position, :work_start_date, profile_picture: [])
    end
end
