# frozen_string_literal: true

module TwilioCallSetup
  class Call
    def initialize(client, from:, to:, twilio_number:, template_url:)
      client.calls.create(
        url: url(to, template_url),
        to: from,
        from: twilio_number
      )
    end

    private

    def url(to, template_url)
      "#{template_url}#{template_url.include?('?') ? '&' : '?'}Contact=#{to}"
    end
  end
end
