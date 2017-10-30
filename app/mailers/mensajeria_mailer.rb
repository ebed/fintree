##
# Mailer que envia correo con los detalles  de accesos por medio de
# MEtodo intentoacceso


class MensajeriaMailer < ActionMailer::Base
  default from: "contacto@reportestecnicos.cl"

  def intentoacceso( correo, agent, momento, resultado)
  	
    @agent = agent
    @correo = correo
    @resultado = resultado
    @momento = momento
    mail(to: correo, subject: "Intento de acceso")

  end
end


