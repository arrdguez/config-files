# Config-files
Automation the i3 configuration. 

The configuration file repository was created to store and maintain all the configuration files that I use to configure my Debian system.

## About 'arandr'


You will install "**arandr**" to run a graphical interface to configure your display and create a copy of a script to use in i3 "config" file, but call it using the "**xrand**" command.
To see the properties of your display use the command: ***xrand -q***

### Example xrand line:
```bash
xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 100.00 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-2 --off --output DP-3 --off
```

Notice that I use "**--rate 100.00** ", my main screen is a GIGABITE which has factory problems with 60.0Hz so I needed to change it to 100Hz using this command.
1. Install arandr to manage your display (deb).

    ```bash
    sudo apt install arandr
    ```

2. Run it using `mod+x` and find `arandr`

3. After finishing, copy the code for the screen position and resolution, save the configuration in the i3 configuration file.




## Dropbox
Add the next sentence.

```bash
#Dropbox
exec --no-startup-id dropbox start
```
