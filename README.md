# Scrivito Example App

## Take this app for a test drive on Heroku!

Log in or sign up at https://scrivito.com, get a fresh CMS. Click the
deploy-to-heroku button and fill in the Scrivito tenant id and API key
of your fresh Scrivito CMS. Fill in an editor password. You will need
this password to switch to editor mode on your deployed heroku app.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Wait until Heroku has finished deployment.

Explore your new Scrivito app.

## Local Installation

Git clone onto your machine and install used gems.

```batchfile
git clone git@github.com:Scrivito/scrivito_example_app
cd scrivito_example_app
bundle
```

Create an .env file in your app root directory for your API credentials.

Your .env file should look like this:

```yaml
SCRIVITO_TENANT = tenant-id-from-scrivito.com-dashboard
SCRIVITO_API_KEY = api-key-from-scrivito.com-dashboard
EDITOR_PASSWORD = my-secret-editor-password
GOOGLE_MAPS_API_KEY = api-key-from-developer.google.com
```

You can leave out EDITOR_PASSWORD. But keep in mind that in this case
everybody who can access your app can change your content. This should
not be a problem if you run your app on localhost. But if you deploy it
in public you should set a password.

You can leave out GOOGLE_MAPS_API_KEY. In this case the maps widgets
will not display a map. You can add the key later.

If you want fresh example content then run

```batchfile
rails runner SeedContentCreator.create
```

The seed content creator will create a new working copy, remove all
existing content, add example pages, and publish the working copy.

In order to start your server run

```batchfile
rails server
```

Open [http://localhost:3000](http://localhost:3000) in your browser.
