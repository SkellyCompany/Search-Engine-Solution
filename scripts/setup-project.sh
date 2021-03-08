cd ..
mkdir SearchEngine
cd SearchEngine

### Pull LoadBalancer
git clone git@github.com:Skelly-Co/Search-Engine-LoadBalancer.git LoadBalancer
cd LoadBalancer
git checkout development
cd ..

### Pull Crawler
git clone git@github.com:Skelly-Co/Search-Engine-Crawler.git Crawler
cd Crawler
git checkout development
cd ..

### Pull Web App
git clone git@github.com:Skelly-Co/Search-Engine-Web.git Web
cd Web
git checkout development
cd ..

### Pull API
git clone git@github.com:Skelly-Co/Search-Engine-API.git API
cd API
git checkout development
cd ..

### Pull LoggerAPI
git clone git@github.com:Skelly-Co/Search-Engine-LoggerAPI.git LoggerAPI
cd LoggerAPI
git checkout development
cd ..
