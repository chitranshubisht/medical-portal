class DoctorsController < ApplicationController
  before_action :authorize_doctor

  def index
    @patients = Patient.all
    @patients_by_day = @patients.group_by { |p| p.registered_on }
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private

  def authorize_doctor
    redirect_to login_path, alert: "Not authorized" unless current_user&.doctor?
  end
end
