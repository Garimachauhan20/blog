class ExampleWorker
 include Sidekiq::Worker 

   def perform(email)
      UserMailer.welcome_email(email).deliver_later
   end

end