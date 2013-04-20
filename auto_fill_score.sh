xdotool mousemove 400 200
xdotool click 1
sleep 1
xdotool key Alt+d
sleep 2
xdotool type 'https://courses.cs.sfu.ca/2013sp-cmpt-130-d1/+a4/gradestatus/'
xdotool type $1
xdotool type '/?from_page=activityinfo'
xdotool key Return
sleep 1
xdotool mousemove 500 760
xdotool click 1
sleep 0.5
xdotool key Ctrl+a
xdotool type $2
xdotool click 5
xdotool mousemove 500 950
xdotool click 1
xdotool key Ctrl+a


