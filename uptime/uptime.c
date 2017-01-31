#include <stdio.h>
#include <stdlib.h>
#include <sys/sysctl.h>
#include <sys/types.h>

#define MIB_SIZE 2

int main(void)
{
    int mib[MIB_SIZE];
    size_t size;
    struct timeval boottime;

    mib[0] = CTL_KERN;
    mib[1] = KERN_BOOTTIME;
    size = sizeof(boottime);
    if (sysctl(mib, MIB_SIZE, &boottime, &size, NULL, 0) == -1) {
        perror("sysctl");
        exit(1);
    }

    printf("boottime.sec=%ld, boottime.tv_usec=%d\n", boottime.tv_sec, boottime.tv_usec);
    return 0;
}
