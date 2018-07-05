# frozen_string_literal: true

module TwilioCallSetup
  class Client
    attr_reader :client

    def initialize(sid:, token:)
      @client = Twilio::REST::Client.new(sid, token)
    end

    def call(from:, to:, twilio_number:, template_url:)
      Call.new(
        @client,
        from: from,
        to: to,
        twilio_number: twilio_number,
        template_url: template_url
      )
    end
  end
end
