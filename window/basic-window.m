#include <Foundation/Foundation.h>
#include <AppKit/NSRunningApplication.h>
#include <string.h>

int main(int argc, char *argv[])
{
    if (argc < 2) {
        NSLog(@"Usage: %s pid\n", argv[0]);
        return 1;
    }

    int pid = atoi(argv[1]);
    NSRunningApplication *app = [NSRunningApplication runningApplicationWithProcessIdentifier : pid];
    if (app == nil) {
        NSLog(@"Pid=%d application is not found", pid);
        return 1;
    }

    NSLog(@"app=%@", app.localizedName);
    return 0;
}
