# frozen_string_literal: true

require "spec_helper"
require "twilio-call-setup"

describe TwilioCallSetup::Client do
  subject(:twilio_client) do
    described_class.new(
      sid: "ai7rw4wrvuoirosdefgs7",
      token: "alkeukrhw49487seruiw4"
    )
  end

  describe "#call" do
    it "initiates a call" do
      expect(TwilioCallSetup::Call).to receive(:new).with(
        twilio_client.client,
        from: "+49123456789",
        to: "+49987654321",
        twilio_number: "+491324354657",
        template_url: "https://handler.twilio.com/twiml/ABCDEFG"
      )

      twilio_client.call(
        from: "+49123456789",
        to: "+49987654321",
        twilio_number: "+491324354657",
        template_url: "https://handler.twilio.com/twiml/ABCDEFG"
      )
    end
  end
end
