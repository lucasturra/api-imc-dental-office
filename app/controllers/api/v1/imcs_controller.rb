class Api::V1::ImcsController < ApplicationController
  def create
    data_json = JSON.parse request.body.read
    @imc = Imc.new(data_json)
    weight = params[:weight]
    height = params[:height]
    msg = ''
    grau = ''
    imc = (weight / (height * height)).round(2)
    if imc < 16 && grau += '0'
        msg += 'Magreza severa'
    elsif imc < 17 && grau += '0'
        msg += 'Magreza moderada'
    elsif imc < 18.5 && grau += '0'
        msg += 'Magreza leve'
    elsif imc < 25 && grau += '0'
        msg += 'Peso normal'
    elsif imc < 30 && grau += 'I'
        msg += 'Sobrepeso'
    elsif imc < 35 && grau += 'I'
        msg += 'Obesidade I'
    elsif imc < 40 && grau += 'II'
        msg += 'Obesidade II'
    else
      grau += 'III'
      msg += 'Obesidade III'
    end
    render json: {
      imc: imc,
      classification: msg,
      obesity: grau
    }
  end
end
