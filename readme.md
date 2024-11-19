## Conversão Fluxo N8N para Python (FastAPI) com Async

![Fluxo N8N para Python](./fluxo.png)

### Setup
```bash
virtualenv venv
source ./venv/bin/activate
pip install -r requirements.txt
```

### Como Executar

```bash
curl --location 'http://127.0.0.1:8000/transcreve-audios' \
--header 'Content-Type: application/json' \
--data-raw '
  {
    "headers": {
      "host": "webhook-ia.cerebro.app.br",
      "user-agent": "axios/1.7.2",
      "content-length": "15723",
      "accept": "application/json, text/plain, */*",
      "accept-encoding": "gzip, compress, deflate, br",
      "content-type": "application/json",
      "x-forwarded-for": "172.18.0.1",
      "x-forwarded-host": "webhook-ia.cerebro.app.br",
      "x-forwarded-port": "443",
      "x-forwarded-proto": "https",
      "x-forwarded-server": "a2e7d31228a0",
      "x-real-ip": "172.18.0.1"
    },
    "params": {},
    "query": {},
    "body": {
      "event": "messages.upsert",
      "instance": "MARCOS",
      "data": {
        "key": {
          "remoteJid": "5521983226180@s.whatsapp.net",
          "fromMe": false,
          "id": "93C8B072717FE29738BFC5E4E6D15DBF"
        },
        "pushName": "MZHUB (ZAP)",
        "message": {
          "audioMessage": {
            "url": "https://mmg.whatsapp.net/v/t62.7117-24/33503277_1306283390777873_1084449934390411316_n.enc?ccb=11-4&oh=01_Q5AaIDrkuMTePOg9XqrA1ayzh-g8D6uyb3UYggo-7nQ954rq&oe=6733B14B&_nc_sid=5e03e0&mms3=true",
            "mimetype": "audio/ogg; codecs=opus",
            "fileSha256": "iBQQ1nLO01PmJG+rAfrLkAMXMOZ6hiwbSjx4taUMzdQ=",
            "fileLength": "10169",
            "seconds": 4,
            "ptt": true,
            "mediaKey": "c1PezCe6nVSaCdAwra4qjkvKmOQdse7TCYQKVL0CaDc=",
            "fileEncSha256": "58y+fn5kaSRN3Ysr6O0xHCHxXctbUUdRi0IlwtNQaCc=",
            "directPath": "/v/t62.7117-24/33503277_1306283390777873_1084449934390411316_n.enc?ccb=11-4&oh=01_Q5AaIDrkuMTePOg9XqrA1ayzh-g8D6uyb3UYggo-7nQ954rq&oe=6733B14B&_nc_sid=5e03e0",
            "mediaKeyTimestamp": "1728854871",
            "contextInfo": {
              "expiration": 7776000,
              "ephemeralSettingTimestamp": "1664312625",
              "entryPointConversionSource": "global_search_new_chat",
              "entryPointConversionApp": "whatsapp",
              "entryPointConversionDelaySeconds": 10,
              "disappearingMode": {
                "initiator": "CHANGED_IN_CHAT",
                "trigger": "UNKNOWN"
              }
            },
            "waveform": "AAAAAAAAAAAFCQIEAjRKYmJiWjtdXWFjTUFGKg4uUBdaVVQqTyVGTVBSNFdjWldJTVtXVlVZPVdbJDASFRgJAw=="
          },
          "messageContextInfo": {
            "deviceListMetadata": {
              "senderKeyHash": "0DqP6++CnEQUHg==",
              "senderTimestamp": "1728853603",
              "recipientKeyHash": "Zc6F2LFA8Au6Aw==",
              "recipientTimestamp": "1728500286"
            },
            "deviceListMetadataVersion": 2,
            "messageSecret": "9/SSQplA77ey/WtKk9vtfJWUnsJsa313Zbr7phUUR3s="
          },
          "base64": "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"
        },
        "contextInfo": {
          "expiration": 7776000,
          "ephemeralSettingTimestamp": "1664312625",
          "entryPointConversionSource": "global_search_new_chat",
          "entryPointConversionApp": "whatsapp",
          "entryPointConversionDelaySeconds": 10,
          "disappearingMode": {
            "initiator": "CHANGED_IN_CHAT",
            "trigger": "UNKNOWN"
          }
        },
        "messageType": "audioMessage",
        "messageTimestamp": 1728854881,
        "owner": "MARCOS",
        "source": "android"
      },
      "destination": "https://webhook-ia.cerebro.app.br/webhook/transcreveaudios",
      "date_time": "2024-10-13T18:28:01.953Z",
      "sender": "5521996204843@s.whatsapp.net",
      "server_url": "https://evolution-ia.cerebro.app.br",
      "apikey": "7lymwfyuwiwu3i8siwvvz"
    },
    "webhookUrl": "https://webhook-ia.cerebro.app.br/webhook/transcreveaudios",
    "executionMode": "production"
  }'

```
# audiotopy
