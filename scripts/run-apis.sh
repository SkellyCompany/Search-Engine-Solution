osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
osascript -e 'tell app "Terminal" to do script "cd ../SearchEngine/API/SearchEngine.API && dotnet watch run --urls=http://localhost:5002/" in window 1'
sleep 1

osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
osascript -e 'tell app "Terminal" to do script "cd ../SearchEngine/API/SearchEngine.API && dotnet watch run --urls=http://localhost:5004/" in window 1'

cd ../SearchEngine/LoadBalancer/LoadBalancer
dotnet watch run --urls=http://localhost:5000/
