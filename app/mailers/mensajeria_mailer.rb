class MensajeriaMailer < ActionMailer::Base
  default from: "contacto@reportestecnicos.cl"

  def intentoacceso( correo, agent, momento, resultado)
  	
    @agent = agent
    @correo = correo
    @resultado = resultado
    @momento = momento
    mail(to: ENV['CORREO_AVISOS'], subject: "Intento de acceso")

  end
end


