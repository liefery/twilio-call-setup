# frozen_string_literal: true

require "spec_helper"
require "twilio-call-setup"

describe TwilioCallSetup::Call do
  subject(:twilio_call) do
    described_class.new(
      client_double,
      from: "+49123456789",
      to: "+49987654321",
      twilio_number: "+491324354657",
      template_url: "https://handler.twilio.com/twiml/ABCDEFG"
    )
  end

  let(:calls_double)    { double(:create) }
  let(:client_double)   { double(calls: calls_double) }

  describe "#initialize" do
    it "initiates a call" do
      expect(calls_double).to receive(:create).with(
        url: "https://handler.twilio.com/twiml/ABCDEFG?Contact=+49987654321",
        to: "+49123456789",
        from: "+491324354657"
      )

      twilio_call
    end
  end
end
