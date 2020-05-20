Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
# puts "Check terminal output below this line"
# puts Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)