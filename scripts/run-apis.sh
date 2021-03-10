firstHost=$(cat ../SearchEngine/LoadBalancer/appsettings.json  | jq -r '.LoadBalancerSettings.FirstHost')
hostsPoolSize=$(cat ../SearchEngine/LoadBalancer/appsettings.json  | jq -r '.LoadBalancerSettings.HostsPoolSize')
hostIncrementationValue=$(cat ../SearchEngine/LoadBalancer/appsettings.json  | jq -r '.LoadBalancerSettings.HostIncrementationValue')

hostNumber=$(echo $firstHost | cut -d':' -f 3)
hostUrl=$(echo $firstHost | cut -d':' -f 1-2)
for (( i=0; i<=$hostsPoolSize-1; i++ ))
do
apiHost="$hostUrl:$hostNumber"

echo "$apiHost"
osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
osascript -e 'tell app "Terminal" to do script "cd ../SearchEngine/API && dotnet watch run --urls='"$apiHost"'" in window 1'

hostNumber=$((hostNumber + hostIncrementationValue))
sleep 0.5
done

osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
osascript -e 'tell app "Terminal" to do script "cd ../SearchEngine/LoggerAPI && dotnet watch run --urls=http://localhost:5002/" in window 1'
sleep 0.5

cd ../SearchEngine/LoadBalancer
dotnet watch run --urls=http://localhost:5000/
