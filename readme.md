# Tiny Drive Classic Asp Starter Project

This project will help you get started with Tiny Drive and allow you to play around with it's features.

## Warning

This uses JScript to generate the key, this is VERY SLOW (4-8 seconds) and not a good production setup. In order to solve this, you would need to re-build this with a JWT Component that can handle the key generation much faster.

## Pre requirements

Classic ASP on a IIS Server on any supported platform.

## Getting started steps

These are the steps needed to get this project running on your machine:

### 1. Clone this repo to your local machine using

```
$ git clone git@github.com:tinymce/tinydrive-classic-asp-starter.git
```

### 2. Change the `apiKey` in `tinydrive-classic-asp-starter/config.asp`

You get the api key from the `API Key Manager` account manager at http://tiny.cloud.

### 3. Create a `tinydrive-classic-asp-starter/private.key` file containing your generated private RSA key

You get the private RSA key from the `JWT Key Manager` account manager at http://tiny.cloud.

Notice that this sample project only supports the older key format PKCS#1 starting with `-----BEGIN RSA PRIVATE KEY-----`.

You can convert the newer format to this older format using open ssl:
```
$ openssl rsa -inform PEM -outform PEM -in new-private.key > private.key
```

### 4. Open the example project at http://localhost/tinydrive-classic-asp-starter

You need to place the project in the wwwroot or configure a virtual directory in the IIS managemenet console.
