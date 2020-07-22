# frozen_string_literal: true

require "spec_helper"
require "twilio-call-setup"
# trying to trigger jenkins with this commit

describe TwilioCallSetup::Call do
  subject(:twilio_call) do
    described_class.new(
      client_double,
      from: "+49123456789",
      to: "+49987654321",
      twilio_number: "+491324354657",
      template_url: template_url
    )
  end

  let(:calls_double)  { double(:create) }
  let(:client_double) { double(calls: calls_double) }
  let(:template_url)  { "https://handler.twilio.com/twiml/ABCDEFG" }

  describe "#initialize" do
    it "initiates a call" do
      expect(calls_double).to receive(:create).with(
        url: "https://handler.twilio.com/twiml/ABCDEFG?Customer=+49987654321",
        to: "+49123456789",
        from: "+491324354657"
      )

      twilio_call
    end

    context "when template_url contains params" do
      let(:template_url) do
        "https://handler.twilio.com/twiml/ABCDEFG?ObjectId=1"
      end

      it "initiates a call" do
        expect(calls_double).to receive(:create).with(
          url: "https://handler.twilio.com/twiml/ABCDEFG"\
               "?ObjectId=1&Customer=+49987654321",
          to: "+49123456789",
          from: "+491324354657"
        )

        twilio_call
      end
    end
  end
end
