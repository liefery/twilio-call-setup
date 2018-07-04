# Twilio Call Setup

Connect two parties anonymously via a phone call.

# Installation

In your terminal run:

```
gem install twilio-call-setup
```

# Setup

To use this gem you have to create a TwiML-Bin template. You can use [template.xml.sample](template.xml.sample) as a starting point. The `Customer` variable contains the phone number passed as `to` parameter, when initiating the call. The `action` attribute of the `Dial` element specifies a URL to which Twilio makes a `GET` or `POST` request after the call ended. [Learn more](https://www.twilio.com/docs/voice/twiml/dial#action).

# Usage

First, connect to the Twilio API:

```
client = TwilioCallSetup::Client.new(sid: "ai7rw4wrvuoirosdefgs7", token: "alkeukrhw49487seruiw4")
```

Then initiate a call:

```
client.call(from: "+49123456789", to: "+49987654321", twilio_number: "+491324354657", template_url: "https://handler.twilio.com/twiml/ABCDEFG")
```

This line initiates a call from the `twilio_number`, which must be verified by Twilio, to `from`. It then follows the instructions provided by `https://handler.twilio.com/twiml/ABCDEFG` to call `to`. Both `from` and `to` can only see the `twilio_number` despite being able to have a normal phone call.
