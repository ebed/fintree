##
# Tarea dedicada a manejar las llamadas al mailer ;emsajeriaMailer

class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(email, user_agent, time, respuesta)
  	@email=email
  	@user_agent=user_agent
  	@time=time
  	@respuesta=respuesta
    MensajeriaMailer.intentoacceso(@email, @user_agent, @time, @respuesta).deliver_later
  end
end
