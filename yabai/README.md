# System Integrity Protection on a Mac

## Warning: This is really dangerous and should not recommended**

## To disable SIP on your system

1. Turn off your Mac (Apple > Shut Down)
2. Hold down Command-R and press the Power button. Keep holding Command-R until the Apple logo appears
3. Wait for OS X to boot into the OS X Utilities window
4. Choose Utilities > Terminal
5. Enter `csrutil disable`
6. Enter `reboot`

## To enable SIP back on your system

1. Follow steps 1 to 4
2. Enter `csrutil enable`
3. To confirm status, type `csrutil status`. It should say `System Integrity Protection status: enabled`
3. Enter `reboot`
