#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

#include <IOKit/IOKitLib.h>
#include <IOKit/pwr_mgt/IOPMLib.h>
#include <IOKit/IOReturn.h>
#include <mach/mach_init.h>

void
fail(char *why)
{
    if ( errno )
	perror(why);
    else
	fprintf(stderr, "%s.\n", why);
    exit(1);
}

int
main(argc, argv)
char **argv;
{
    mach_port_t kernel;
    io_connect_t controller;

    if ( IOMasterPort(bootstrap_port, &kernel) != kIOReturnSuccess )
	fail("Can't find the kernel port");
    
    if ( (controller=IOPMFindPowerManagement(kernel)) == 0 )
	fail("Can't find the power management port");
    
    if ( IOPMSleepSystem(controller) != kIOReturnSuccess )
	fail("The sleep request failed");

    IOServiceClose(controller);
    return 0;
}
