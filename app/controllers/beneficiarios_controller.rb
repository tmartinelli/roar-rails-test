class BeneficiariosController < ApplicationController
  include Roar::Rails::ControllerAdditions

  before_action :load_beneficiario, only: :show
  before_action :load_beneficiario_for_upsert, only: :upsert

  def index
    @beneficiarios = Beneficiario.all
    render json: @beneficirios
  end

  def show
    @beneficiario = Beneficiario.find_by(cpf: params[:cpf])
    render json: @beneficiario
  end

  def create
    @beneficiario = Beneficiario.new
    consume!(@beneficiario)
    @beneficiario.save!
    render json: @beneficiario
  end

  def upsert
    @beneficiario ||= Beneficiario.new(cpf: params[:cpf])
    consume!(@beneficiario)
    @beneficiario.save!
    render json: @beneficiario, status: @status, location: @location
  end

  protected

  def load_beneficiario
    @beneficiario = Beneficiario.find_by!(cpf: params[:cpf])
  end

  def load_beneficiario_for_upsert
    if @beneficiario = Beneficiario.find_by(cpf: params[:cpf])
      @status = 200
      @location = nil
    else
      @status = 201
      @location = beneficiario_url
    end
  end
end
