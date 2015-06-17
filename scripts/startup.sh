#!/bin/sh

# Start up the launch tower computer controller
cd ~/psas/launch-tower-comm/launch-tower-comm
ps ax | grep [l]tc.py || nohup ./ltc.py &

# Start up the rocket flight computer controller
cd ~/psas/commander
ps ax | grep [a]pp.py || nohup python app.py &

# Start up the telemetry receiver
cd ~/psas/telemetry
ps ax | grep [t]elemetry.py || nohup ./telemetry.py &

sleep 1
exec firefox "http://localhost:5000" "http://ground.psas.lan:8080"
