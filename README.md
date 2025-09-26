# Vulkan-for-Samsung-Devices

Force Vulkan Renderer (Temporary)
A simple Windows batch script to temporarily force the Android UI renderer to use Vulkan (via SkiaVK) instead of the default OpenGL.

This can sometimes improve UI fluidity and performance on certain devices, particularly for gaming or heavy UI usage. However, it can also cause instability in apps that are not optimized for Vulkan.

⚠️ THIS IS A TEMPORARY SOLUTION. The setting will be reset as soon as you reboot your device.

Features
Sets skiavk as the default hardware UI renderer.

Restarts key system services to apply the change without a full reboot.

Interactive prompt to confirm before running.

Automatically detects and restarts Gboard if it's installed.

Requirements
Windows PC

Android Debug Bridge (ADB):

Ensure adb.exe is in the same folder as the script, or that its location is included in your system's PATH environment variable.

An Android Device with USB Debugging enabled.

You can enable this in Settings > Developer options.

Authorized ADB Connection:

Your device must be authorized. When you run adb devices in a command prompt, it should show your device listed as device, not unauthorized.

How to Use
Download: Clone this repository or download the force-vulkan.bat script.

Setup: Place the .bat file in the same folder as your adb.exe.

Connect: Connect your Android device to your PC via USB and ensure it's unlocked and USB Debugging is enabled.

Run: Double-click the force-vulkan.bat file.

Confirm: A command prompt will appear. Press Y and then Enter to apply the changes.

Your phone's System UI and launcher will restart, and the Vulkan renderer will become active.

The Stable Alternative (No Root Required)
Forcing Vulkan system-wide can break apps (like video players) that don't support it well. A much safer and more stable method is to enable it only for specific apps.

Enable Developer Options on your device.

Go to Settings > Developer options > Graphics Driver (or Graphics Driver Preferences).

Tap on an app (e.g., a game) and change its driver from "Default" to "System Graphics Driver". This often prioritizes Vulkan where available.

This method is permanent for the selected apps and won't affect the stability of others.

License
This project is licensed under the MIT License. See the LICENSE file for details.
