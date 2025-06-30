#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    // Check for accessibility permissions
    const void *keys[] = { kAXTrustedCheckOptionPrompt };
    const void *values[] = { kCFBooleanTrue };
    CFDictionaryRef options = CFDictionaryCreate(
        kCFAllocatorDefault, keys, values, 1,
        &kCFCopyStringDictionaryKeyCallBacks,
        &kCFTypeDictionaryValueCallBacks);

    if (!AXIsProcessTrustedWithOptions(options)) {
      NSLog(@"[ERROR] Accessibility permissions not granted. Enable them in System Settings > Privacy & Security > Accessibility.");
      CFRelease(options);
      return 1;
    }

    CFRelease(options);

    if (argc != 4) {
      NSLog(@"Usage: %s <x> <y> <target_space>", argv[0]);
      return 1;
    }

    double x = atof(argv[1]);
    double y = atof(argv[2]);
    int spaceKey = atoi(argv[3]);

    if (spaceKey < 1 || spaceKey > 9) {
      NSLog(@"Invalid space number. Must be between 1 and 9");
      return 1;
    }

    CGPoint loc = CGPointMake(x, y);

    // Mouse down
    CGEventRef mouseDown = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDown, loc, kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, mouseDown);
    CFRelease(mouseDown);

    // Wait briefly while holding click
    usleep(500000); // 0.5 seconds

    // Press Control + number key
    CGKeyCode keyCode = 18 + (spaceKey - 1); // Key codes 18-26 correspond to 1-9
    CGEventRef keyDown = CGEventCreateKeyboardEvent(NULL, keyCode, true);
    CGEventSetFlags(keyDown, kCGEventFlagMaskControl);
    CGEventPost(kCGHIDEventTap, keyDown);
    CFRelease(keyDown);

    CGEventRef keyUp = CGEventCreateKeyboardEvent(NULL, keyCode, false);
    CGEventSetFlags(keyUp, kCGEventFlagMaskControl);
    CGEventPost(kCGHIDEventTap, keyUp);
    CFRelease(keyUp);

    // Mouse up
    CGEventRef mouseUp = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseUp, loc, kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, mouseUp);
    CFRelease(mouseUp);

    NSLog(@"[INFO] Done");
  }
  return 0;
}
