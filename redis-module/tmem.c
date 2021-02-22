#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>


#include "tmem.h"

extern int fd;

int tmem_ioctl_get(void *key, size_t key_len, void *value, size_t *value_lenp, long flags)
{

    int ret = 0;

    struct tmem_get_request tmem_get_request = {
        .key = key,
        .key_len = key_len,
	.value = value,
	.value_lenp = value_lenp,
    };

    struct tmem_request tmem_request = {
	.get = tmem_get_request,
	.flags = flags,
    };

    ret = ioctl(fd, TMEM_GET, &tmem_request);
    if (ret)
	perror("ioctl_get");


    return ret;
}

int tmem_ioctl_put(void *key, size_t key_len, void *value, size_t value_len, long flags,struct myTimes *times)
{
    struct timespec tp1,tp2;
    clockid_t clk_id=CLOCK_REALTIME;
    int ret = 0;

    struct tmem_put_request tmem_put_request = {
        .key = key,
        .key_len = key_len,
        .value = value,
        .value_len = value_len,
    };

    struct tmem_request tmem_request = {
	.put = tmem_put_request,
	.flags = flags,
    };

    clock_gettime(clk_id,&tp1);
    ret = ioctl(fd, TMEM_PUT, &tmem_request);
    clock_gettime(clk_id,&tp2);

    if (ret)
	perror("ioctl_put");

  if(times!=NULL){
    times->driverTime = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;
    times->hypercallTime = 100;/*something dummy just to be summed afterwards*/
  }
    return ret;
}

int tmem_ioctl_inval(void *key, size_t key_len, long flags)
{

    int ret = 0;

    struct tmem_invalidate_request tmem_invalidate_request = {
        .key = key,
        .key_len = key_len,
    };

    struct tmem_request tmem_request = {
	.inval = tmem_invalidate_request,
	.flags = flags,
    };

    ret = ioctl(fd, TMEM_INVAL, &tmem_request);
    if (ret)
	perror("ioctl_inval");


    return ret;
}

int tmem_ioctl_control(long flags)
{
    int ret = 0;

    ret = ioctl(fd, TMEM_CONTROL, flags);
    if (ret)
	perror("ioctl_control");


    return ret;

}

int tmem_ioctl_generate_size(size_t size)
{
    int ret = 0;

    ret = ioctl(fd, TMEM_GENERATE_SIZE, (long) size);
    if (ret)
	perror("ioctl_control");


    return ret;

}
