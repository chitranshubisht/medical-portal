class PatientsController < ApplicationController
  before_action :authorize_receptionist

  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.registered_on = Date.today
    if @patient.save
      redirect_to patients_path, notice: "Patient registered successfully"
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path, notice: "Patient deleted successfully"
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :date_of_birth, :address, :phone)
  end
end
