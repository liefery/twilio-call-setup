# frozen_string_literal: true

module TwilioCallSetup
  class Call
    def initialize(client, from:, to:, twilio_number:, template_url:)
      client.calls.create(
        url: "#{template_url}?Customer=#{to}",
        to: from,
        from: twilio_number
      )
    end
  end
end
