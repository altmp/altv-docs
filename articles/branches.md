# Branches

In alt:V there are multiple development branches, which represent different development states of the alt:V client and server. The server and the client needs to be on the same branch to be able to connect. For normal users the release branch is recommended.

# Branch Overview

Here you will get a overview of the available branches:

## Release

This branch is for production, it is consider as stable. This is the only branch, where the masterlist is available. If you run a public server, this server should run this branch. The icon is colored green.

## RC (Release Candidate)

This branch is for the next update, every update that will come to release will be at least 1-2 weeks before in this branch. It can be considered as mostly stable, here the last bugs will be fixed before they are merged to release. If you run a public server, you should use this branch before updates to update your server code to a new version of alt:V. The icon is colored orange.

## Dev (Development)

This branch contains the newest features, not all features will be moved to RC. This branch can contain bugs and unfinished features, the features also can change. If you want the newest features you can test them on this branch and help us finding bugs. The icon is colored blue.

## Internal

This branch isn't public and can only be used by developers of alt:V. This icon is colored violet.

# How to change the Branch?

Changing the branch is easy, for the client you need to open the altv.toml and change the branch to the value you want to use (release, rc, dev). For the server you need to download the new files for the branch you want again from the alt:V Website.
