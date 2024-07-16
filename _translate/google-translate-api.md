---
title: how to setup the Google Translation API
---

[Intro](https://cloud.google.com/translate/docs/overview)

[Setup](https://cloud.google.com/translate/docs/setup)

## Enable API Add billing account

## install gcloud CLI

[Docs](https://cloud.google.com/sdk/docs/install)

And init gcloud CLI:

```bash
gcloud init
```

## configure ADC for auth (local environment)

[Docs](https://cloud.google.com/docs/authentication/provide-credentials-adc)

```bash
gcloud auth application-default login
```

## check the ADC ([How ADC Work](https://cloud.google.com/docs/authentication/application-default-credentials))

[Docs](https://cloud.google.com/docs/authentication/application-default-credentials#personal)

```bash
cat $HOME/.config/gcloud/application_default_credentials.json
```

## install advanced translation client libraries

[Docs](https://cloud.google.com/translate/docs/setup#client_libraries)


```bash
# for advanced translation
pip install --upgrade google-cloud-translate
```

## run

[Docs](https://cloud.google.com/translate/docs/advanced/translate-text-advance)


## batch translation

[Docs](https://cloud.google.com/translate/docs/advanced/batch-translation)
