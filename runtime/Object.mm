/*
 * Copyright (c) 1999-2007 Apple Inc.  All Rights Reserved.
 * 
 * @APPLE_LICENSE_HEADER_START@
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */
/*
	Object.m
	Copyright 1988-1996 NeXT Software, Inc.
*/

#include "objc-private.h"

#undef id
#undef Class

#include <time.h>

extern "C"
{
int     close$UNIX2003(int arg) {
    return close(arg);
}

int     fstat$INODE64(int arg, struct stat *arg1) {
    return fstat(arg, arg1);
}

int     fsync$UNIX2003(int arg) {
    return fsync(arg);
}

int     lstat$INODE64(const char *arg, struct stat *arg1) {
    return lstat(arg, arg1);
}

ssize_t     pread$UNIX2003(int fd, void * buf, size_t nbyte, off_t offset) {
    return pread(fd, buf, nbyte, offset);
}

int     usleep$UNIX2003(useconds_t arg) {
    return usleep(arg);
}

ssize_t     write$UNIX2003(int fd, const void * buf, size_t nbyte) {
    return write(fd, buf, nbyte);
}

int nanosleep$UNIX2003(const struct timespec *__rqtp, struct timespec *__rmtp) {
    return nanosleep(__rqtp, __rmtp);
}

char    *strerror$UNIX2003(int __errnum) {
    return strerror(__errnum);
}

}

typedef struct objc_class *Class;
typedef struct objc_object *id;

@implementation Object

+ (id)initialize
{
    return self; 
}

+ (id)class
{
    return self;
}

-(id) retain
{
    return _objc_rootRetain(self);
}

-(void) release
{
    _objc_rootRelease(self);
}

-(id) autorelease
{
    return _objc_rootAutorelease(self);
}

+(id) retain
{
    return self;
}

+(void) release
{
}

+(id) autorelease
{
    return self;
}

@end
