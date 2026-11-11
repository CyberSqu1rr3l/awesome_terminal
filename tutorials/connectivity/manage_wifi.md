# WiFi Management

### 1. Enable or disable WiFi
Use `networksetup` to turn the device's WiFi on or off.
```text
networksetup -setairportpower en0 [en1] on [off]
```

### 2. List network interfaces
List all available hardware network ports and configured network services with `networksetup`.
```text
networksetup -listallhardwareports
networksetup -listallnetworkservices
```
