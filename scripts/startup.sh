# Start up the launch tower computer controller
cd psas/launch-tower-comm/launch-tower-comm
ps ax | grep -v grep | grep ltc.py || nohup ./ltc.py &
cd -

# Start up the rocket flight computer controller
cd psas/commander
ps ax | grep -v grep | grep app.py || nohup python app.py &
firefox "http://localhost:5000"
cd -

# Start up the telemetry receiver
cd psas/telemetry
ps ax | grep -v grep | grep telemetry.py || nohup ./telemetry.py &
firefox "http://ground.psas.lan:8080"
cd -