import os
import resend

resend.api_key = "AQUI VA TU API"

params = {
    "from": "Python SUPERDATA <noreply@superdata.dev>",
    "to": ["noreply@superdata.dev"],
    "subject": "hi",
    "html": "<strong>hello, world!</strong>",
    "headers": {
      "X-Entity-Ref-ID": "123456789"
    }
}

email = resend.Emails.send(params)
print(email)