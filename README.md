<div style="text-align: center;">
<h1>ScorePAL</h1>
<img alt="ScorePAL" src="assets/images/scorepal/logo-inline.png" >
<p>A mobile app to manage a football team and analyse their statistics</p>
<a href="https://choosealicense.com/licenses/mit/"><img alt="MIT License" src="https://img.shields.io/badge/License-MIT-green.svg"></a>
<a href="https://opensource.org/licenses/"><img alt="GPLv3 License" src="https://img.shields.io/badge/License-GPL%20v3-yellow.svg"></a>
<a href="http://www.gnu.org/licenses/agpl-3.0"><img alt="AGPL License" src="https://img.shields.io/badge/License-MIT-blue.svg"></a>
</div>

## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

## Tech Stack

**Client:** Flutter 3.27.3 (Dart 3.6.1)

**Server:** ASP.Net (.Net 8), MySQL

## Installation

Install ScorePAL by cloning both the server and the app repositories

```bash
# Cloning the app repository
git clone https://github.com/Vamos-Vamos/App.git

# Enter the app project
cd App

# Install the flutter dependencies
flutter pub get

# Cloning the server repository
git clone https://github.com/Vamos-Vamos/Server.git
```

## Deployment

```bash
# Enter the server project folder
cd Server/ScorePAL

# Build the docker image
docker build .

# Create a network to connect with the database
 docker network create -d bridge web

# Enter the Server folder
cd ..

# Run the container
docker-compose -f compose.yml up
```

And voila your API is running in the background, you can manage it using Docker Desktop

## Roadmap

- User management
- Team statistics analysis
- User statistics
- Match History
- And much more

## Feedback

If you have any feedback, please reach me using discord: @casahxd

## Contributors
<a href="https://github.com/scorepal/app/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=scorepal/app" />
</a>

Made with [contrib.rocks](https://contrib.rocks).