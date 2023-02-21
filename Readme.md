# Sample Dopple Project to inject variables to terraform
This is a sample project that contains code to inject Dopple Project configs to terraform variables securely.

## Doppler setup

In the root directory setup with with following command:

```
doppler setup
```

## Doppler without provider

```
cd no_provider

terrafrom init

terrafrom plan

doppler run --name-transformer tf-var -- terraform plan
```


## Doppler Provider 

```
cd doppler_provider

terrafrom init

terrafrom plan
// Enter the var.doppler_token to start the plan and which will inject the variable
```

