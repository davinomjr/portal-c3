namespace :devise do

 desc "Envia instrucoes de reset para todos os usuarios"
  task send_password_reset_instructions: :environment do
    user = User.find_by_id(24)
    token = user.send(:set_reset_password_token)
    Devise::Mailer.reset_password_instructions(user, token)
  end

  desc "CUIDADO: Reseta todas as senhas e envia instrucoes de reset para todos os usuarios. Isto ira bloquear todos os usuarios(Realizar apenas quando o servidor for comprometido." 
   task reset_and_send_password_reset_instructions: :environment do
    User.all.each do |user|
      # Generate random, long password that the user will never know:
      new_password = Devise.friendly_token(length = 50)
      user.reset_password(new_password, new_password)

      # Send instructions so user can enter a new password:
      user.send_reset_password_instructions
    end
  end


end
