# Mirror Displays

This is a simple example of how to mirror the primary display to an external display on iOS

## Usage

- Import the LVExternalDisplayManager.h file from your App Delegate
- call [[LVExternalDisplayManager sharedInstance] detectExternalDisplays] from your App Delegate didFinishLaunchingWithOptions:
- please let me know if this doesn't work and I'll fix it.  I extracted it from my project and didn't test (sorry)