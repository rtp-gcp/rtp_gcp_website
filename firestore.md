# Firestore Notes

Firestore is the free tier database.  You have 1 GB of storage and 50K queries per day.


Two Modes

* native
    * api firestore
    * real-time
    * has mobile/web client libraries
    * web console page in two locations
        * firestore page in GCP console
        * Firebase console
* datastore 
    * api datastore
    * Web console page in one location - GCP console


It looks like Firestore - native mode is the correct choice for our purposes.

URLs

* [Getting started with Firebase Hosting](https://www.youtube.com/watch?v=P0x0LmiknJc)
* [Getting started with Firebase Authentication](https://www.youtube.com/watch?v=rbuSx1yEgV8&t=58s)
* [Getting started with Firebase for the web](https://www.youtube.com/watch?v=rQvOAnNvcNQ)
* [Building a Node.js app on App Engine](https://cloud.google.com/appengine/docs/standard/nodejs/building-app)
* [The firebase console](https://console.firebase.google.com/u/0/)

# baby steps

We used the Building a Node.js app document as a guide to building and deploying as webapp.

## contents of `app.yaml`

```
runtime: nodejs16

```

## contents of `package.json`

```
{
  "name": "my-nodejs-service",
  "version": "1.0.0",
  "description": "A test webservice",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.18.2"
  },
  "scripts": {
    "start": "node server.js"
  }
}

```
## contents of `server.json`

```
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from App Engine!');
});

// Listen to the App Engine-specified port, or 8080 otherwise
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}...`);
});

```
## contents of `.gcloudignore`

This gets added when deployed. See below for workflow.

```
# This file specifies files that are *not* uploaded to Google Cloud
# using gcloud. It follows the same syntax as .gitignore, with the addition of
# "#!include" directives (which insert the entries of the given .gitignore-style
# file at that point).
#
# For more information, run:
#   $ gcloud topic gcloudignore
#
.gcloudignore
# If you would like to upload your .git directory, .gitignore file or files
# from your .gitignore file, remove the corresponding line
# below:
.git
.gitignore

# Node.js dependencies:
node_modules/

```
## Workflow

1. Create a gcp project to host the webapp
2. `gcloud init` to select the gcp project 
3. `npm update`
4. `npm init`
5. `npm install express`
6. `npm start` to run a local version of the webapp
7.  `gcloud app deploy` to deploy to gcp

```

```
