I'm using [Xmonad](https://github.com/husseljoo/xmonad-config).

Need to improve multi-monitor setup.
As of now for the current home setup, running this command at startup makes it work as intended.

```
xrandr --output DP-2 --primary --mode 1920x1080 --output HDMI-0 --mode 2560x1440 --right-of DP-2
```

#### TODO

- make it seamless by running at startup
- be able to configure easily when using another setup (different screen resolutions, more screens etc.)
