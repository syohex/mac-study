#import <Foundation/Foundation.h>
#import <AppKit/NSRunningApplication.h>
#include <string.h>

int main(int argc, char *argv[])
{
    if (argc < 2) {
        NSLog(@"Usage: a.out pid");
        return 1;
    }

    int pid = atoi(argv[1]);
    NSRunningApplication *app = [NSRunningApplication runningApplicationWithProcessIdentifier: (pid_t)pid];
    if (app == nil) {
        NSLog(@"application(pid=%d) is not found", pid);
        return 1;
    }
    BOOL ret = [app activateWithOptions: (NSApplicationActivateAllWindows|NSApplicationActivateIgnoringOtherApps)];
    NSLog(@"Activate application %@: Activate=%d", [app localizedName], ret);

    return 0;
}
