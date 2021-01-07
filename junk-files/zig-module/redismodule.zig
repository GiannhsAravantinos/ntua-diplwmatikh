pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
const struct_unnamed_1 = extern struct {
    __val: [2]c_int,
};
pub const __fsid_t = struct_unnamed_1;
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*c_void;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.C) __uint16_t {
    var __bsx = arg___bsx;
    return (@bitCast(__uint16_t, @truncate(c_short, (((@bitCast(c_int, @as(c_uint, (__bsx))) >> @intCast(@import("std").math.Log2Int(c_int), 8)) & @as(c_int, 255)) | ((@bitCast(c_int, @as(c_uint, (__bsx))) & @as(c_int, 255)) << @intCast(@import("std").math.Log2Int(c_int), 8))))));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.C) __uint32_t {
    var __bsx = arg___bsx;
    return ((((((__bsx) & @as(c_uint, 4278190080)) >> @intCast(@import("std").math.Log2Int(c_uint), 24)) | (((__bsx) & @as(c_uint, 16711680)) >> @intCast(@import("std").math.Log2Int(c_uint), 8))) | (((__bsx) & @as(c_uint, 65280)) << @intCast(@import("std").math.Log2Int(c_uint), 8))) | (((__bsx) & @as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 24)));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.C) __uint64_t {
    var __bsx = arg___bsx;
    return @bitCast(__uint64_t, @truncate(c_ulong, (((((((((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 18374686479671623680)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 56)) | ((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 71776119061217280)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 40))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 280375465082880)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 24))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 1095216660480)) >> @intCast(@import("std").math.Log2Int(c_ulonglong), 8))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 4278190080)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 8))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 16711680)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 24))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 65280)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 40))) | ((@bitCast(c_ulonglong, @as(c_ulonglong, (__bsx))) & @as(c_ulonglong, 255)) << @intCast(@import("std").math.Log2Int(c_ulonglong), 56)))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.C) __uint16_t {
    var __x = arg___x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.C) __uint32_t {
    var __x = arg___x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.C) __uint64_t {
    var __x = arg___x;
    return __x;
}
const struct_unnamed_2 = extern struct {
    __val: [16]c_ulong,
};
pub const __sigset_t = struct_unnamed_2;
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t,
    tv_usec: __suseconds_t,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
const struct_unnamed_3 = extern struct {
    __fds_bits: [16]__fd_mask,
};
pub const fd_set = struct_unnamed_3;
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list,
    __next: [*c]struct___pthread_internal_list,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist,
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int,
    __count: c_uint,
    __owner: c_int,
    __nusers: c_uint,
    __kind: c_int,
    __spins: c_short,
    __elision: c_short,
    __list: __pthread_list_t,
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint,
    __writers: c_uint,
    __wrphase_futex: c_uint,
    __writers_futex: c_uint,
    __pad3: c_uint,
    __pad4: c_uint,
    __cur_writer: c_int,
    __shared: c_int,
    __rwelision: i8,
    __pad1: [7]u8,
    __pad2: c_ulong,
    __flags: c_uint,
};
const struct_unnamed_6 = extern struct {
    __low: c_uint,
    __high: c_uint,
};
const union_unnamed_5 = extern union {
    __wseq: c_ulonglong,
    __wseq32: struct_unnamed_6,
};
const struct_unnamed_9 = extern struct {
    __low: c_uint,
    __high: c_uint,
};
const union_unnamed_8 = extern union {
    __g1_start: c_ulonglong,
    __g1_start32: struct_unnamed_9,
};
pub const struct___pthread_cond_s = extern struct {
    unnamed_4: union_unnamed_5,
    unnamed_7: union_unnamed_8,
    __g_refs: [2]c_uint,
    __g_size: [2]c_uint,
    __g1_orig_size: c_uint,
    __wrefs: c_uint,
    __g_signals: [2]c_uint,
};
pub const pthread_t = c_ulong;
const union_unnamed_10 = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_mutexattr_t = union_unnamed_10;
const union_unnamed_11 = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = union_unnamed_11;
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
const union_unnamed_12 = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_mutex_t = union_unnamed_12;
const union_unnamed_13 = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_cond_t = union_unnamed_13;
const union_unnamed_14 = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlock_t = union_unnamed_14;
const union_unnamed_15 = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = union_unnamed_15;
pub const pthread_spinlock_t = c_int;
const union_unnamed_16 = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrier_t = union_unnamed_16;
const union_unnamed_17 = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_barrierattr_t = union_unnamed_17;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
const union_unnamed_19 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
const struct_unnamed_18 = extern struct {
    __count: c_int,
    __value: union_unnamed_19,
};
pub const __mbstate_t = struct_unnamed_18;
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t,
    __state: __mbstate_t,
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t,
    __state: __mbstate_t,
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = @OpaqueType();
pub const struct__IO_codecvt = @OpaqueType();
pub const struct__IO_wide_data = @OpaqueType();
pub const struct__IO_FILE = extern struct {
    _flags: c_int,
    _IO_read_ptr: [*c]u8,
    _IO_read_end: [*c]u8,
    _IO_read_base: [*c]u8,
    _IO_write_base: [*c]u8,
    _IO_write_ptr: [*c]u8,
    _IO_write_end: [*c]u8,
    _IO_buf_base: [*c]u8,
    _IO_buf_end: [*c]u8,
    _IO_save_base: [*c]u8,
    _IO_backup_base: [*c]u8,
    _IO_save_end: [*c]u8,
    _markers: ?*struct__IO_marker,
    _chain: [*c]struct__IO_FILE,
    _fileno: c_int,
    _flags2: c_int,
    _old_offset: __off_t,
    _cur_column: c_ushort,
    _vtable_offset: i8,
    _shortbuf: [1]u8,
    _lock: ?*_IO_lock_t,
    _offset: __off64_t,
    _codecvt: ?*struct__IO_codecvt,
    _wide_data: ?*struct__IO_wide_data,
    _freeres_list: [*c]struct__IO_FILE,
    _freeres_buf: ?*c_void,
    __pad5: usize,
    _mode: c_int,
    _unused2: [20]u8,
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const _IO_lock_t = c_void;
pub const fpos_t = __fpos_t;
pub extern var stdin: [*c]FILE;
pub extern var stdout: [*c]FILE;
pub extern var stderr: [*c]FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam(__s: [*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fclose(__stream: [*c]FILE) c_int;
pub extern fn fflush(__stream: [*c]FILE) c_int;
pub extern fn fflush_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fopen(__filename: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) [*c]FILE;
pub extern fn fmemopen(__s: ?*c_void, __len: usize, __modes: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) [*c]FILE;
pub extern fn setbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: [*c]FILE) void;
pub extern fn fprintf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int;
pub extern fn printf(__format: [*c]const u8, ...) c_int;
pub extern fn sprintf(__s: [*c]u8, __format: [*c]const u8, ...) c_int;
pub const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*c_void,
    reg_save_area: ?*c_void,
};
pub extern fn vfprintf(__s: [*c]FILE, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub fn vprintf(arg___fmt: [*c]const u8, arg___arg: [*c]struct___va_list_tag) callconv(.C) c_int {
    var __fmt = arg___fmt;
    var __arg = arg___arg;
    return vfprintf(stdout, __fmt, __arg);
}
pub extern fn vsprintf(__s: [*c]u8, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn snprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn fgetc(__stream: [*c]FILE) c_int;
pub extern fn getc(__stream: [*c]FILE) c_int;
pub fn getchar() callconv(.C) c_int {
    return getc(stdin);
} // /usr/lib/zig/0.6.0/lib/zig/libc/include/generic-glibc/sys/cdefs.h:402:33: warning: TODO implement translation of CastKind BuiltinFnToFnPtr
pub const getc_unlocked = @compileError("unable to translate function"); // /usr/lib/zig/0.6.0/lib/zig/libc/include/generic-glibc/sys/cdefs.h:402:33: warning: TODO implement translation of CastKind BuiltinFnToFnPtr
pub const getchar_unlocked = @compileError("unable to translate function"); // /usr/lib/zig/0.6.0/lib/zig/libc/include/generic-glibc/sys/cdefs.h:402:33: warning: TODO implement translation of CastKind BuiltinFnToFnPtr
pub const fgetc_unlocked = @compileError("unable to translate function");
pub extern fn fputc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc(__c: c_int, __stream: [*c]FILE) c_int;
pub fn putchar(arg___c: c_int) callconv(.C) c_int {
    var __c = arg___c;
    return putc(__c, stdout);
} // /usr/lib/zig/0.6.0/lib/zig/libc/include/generic-glibc/sys/cdefs.h:402:33: warning: TODO implement translation of CastKind BuiltinFnToFnPtr
pub const fputc_unlocked = @compileError("unable to translate function"); // /usr/lib/zig/0.6.0/lib/zig/libc/include/generic-glibc/sys/cdefs.h:402:33: warning: TODO implement translation of CastKind BuiltinFnToFnPtr
pub const putc_unlocked = @compileError("unable to translate function"); // /usr/lib/zig/0.6.0/lib/zig/libc/include/generic-glibc/sys/cdefs.h:402:33: warning: TODO implement translation of CastKind BuiltinFnToFnPtr
pub const putchar_unlocked = @compileError("unable to translate function");
pub extern fn getw(__stream: [*c]FILE) c_int;
pub extern fn putw(__w: c_int, __stream: [*c]FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*c_void, __size: c_ulong, __n: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn fwrite(__ptr: ?*const c_void, __size: c_ulong, __n: c_ulong, __s: [*c]FILE) c_ulong;
pub extern fn fread_unlocked(noalias __ptr: ?*c_void, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const c_void, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fseek(__stream: [*c]FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: [*c]FILE) c_long;
pub extern fn rewind(__stream: [*c]FILE) void;
pub extern fn fseeko(__stream: [*c]FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) __off_t;
pub extern fn fgetpos(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: [*c]FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: [*c]FILE) void;
pub extern fn feof(__stream: [*c]FILE) c_int;
pub extern fn ferror(__stream: [*c]FILE) c_int;
pub extern fn clearerr_unlocked(__stream: [*c]FILE) void;
pub fn feof_unlocked(arg___stream: [*c]FILE) callconv(.C) c_int {
    var __stream = arg___stream;
    return (((__stream).*._flags & @as(c_int, 16)) != @as(c_int, 0));
}
pub fn ferror_unlocked(arg___stream: [*c]FILE) callconv(.C) c_int {
    var __stream = arg___stream;
    return (((__stream).*._flags & @as(c_int, 32)) != @as(c_int, 0));
}
pub extern fn perror(__s: [*c]const u8) void;
pub extern var sys_nerr: c_int;
pub extern const sys_errlist: [*c]const [*c]const u8;
pub extern fn fileno(__stream: [*c]FILE) c_int;
pub extern fn fileno_unlocked(__stream: [*c]FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn pclose(__stream: [*c]FILE) c_int;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: [*c]FILE) void;
pub extern fn ftrylockfile(__stream: [*c]FILE) c_int;
pub extern fn funlockfile(__stream: [*c]FILE) void;
pub extern fn __uflow([*c]FILE) c_int;
pub extern fn __overflow([*c]FILE, c_int) c_int;
pub const mstime_t = c_longlong;
pub const struct_RedisModuleCtx = @OpaqueType();
pub const RedisModuleCtx = struct_RedisModuleCtx;
pub const struct_RedisModuleKey = @OpaqueType();
pub const RedisModuleKey = struct_RedisModuleKey;
pub const struct_RedisModuleString = @OpaqueType();
pub const RedisModuleString = struct_RedisModuleString;
pub const struct_RedisModuleCallReply = @OpaqueType();
pub const RedisModuleCallReply = struct_RedisModuleCallReply;
pub const struct_RedisModuleIO = @OpaqueType();
pub const RedisModuleIO = struct_RedisModuleIO;
pub const struct_RedisModuleType = @OpaqueType();
pub const RedisModuleType = struct_RedisModuleType;
pub const struct_RedisModuleDigest = @OpaqueType();
pub const RedisModuleDigest = struct_RedisModuleDigest;
pub const struct_RedisModuleBlockedClient = @OpaqueType();
pub const RedisModuleBlockedClient = struct_RedisModuleBlockedClient;
pub const RedisModuleCmdFunc = ?fn (?*RedisModuleCtx, [*c]?*RedisModuleString, c_int) callconv(.C) c_int;
pub const RedisModuleTypeLoadFunc = ?fn (?*RedisModuleIO, c_int) callconv(.C) ?*c_void;
pub const RedisModuleTypeSaveFunc = ?fn (?*RedisModuleIO, ?*c_void) callconv(.C) void;
pub const RedisModuleTypeRewriteFunc = ?fn (?*RedisModuleIO, ?*RedisModuleString, ?*c_void) callconv(.C) void;
pub const RedisModuleTypeMemUsageFunc = ?fn (?*const c_void) callconv(.C) usize;
pub const RedisModuleTypeDigestFunc = ?fn (?*RedisModuleDigest, ?*c_void) callconv(.C) void;
pub const RedisModuleTypeFreeFunc = ?fn (?*c_void) callconv(.C) void;
pub const struct_RedisModuleTypeMethods = extern struct {
    version: u64,
    rdb_load: RedisModuleTypeLoadFunc,
    rdb_save: RedisModuleTypeSaveFunc,
    aof_rewrite: RedisModuleTypeRewriteFunc,
    mem_usage: RedisModuleTypeMemUsageFunc,
    digest: RedisModuleTypeDigestFunc,
    free: RedisModuleTypeFreeFunc,
};
pub const RedisModuleTypeMethods = struct_RedisModuleTypeMethods;
pub export var RedisModule_Alloc: ?fn (usize) callconv(.C) ?*c_void = undefined;
pub export var RedisModule_Realloc: ?fn (?*c_void, usize) callconv(.C) ?*c_void = undefined;
pub export var RedisModule_Free: ?fn (?*c_void) callconv(.C) void = undefined;
pub export var RedisModule_Calloc: ?fn (usize, usize) callconv(.C) ?*c_void = undefined;
pub export var RedisModule_Strdup: ?fn ([*c]const u8) callconv(.C) [*c]u8 = undefined;
pub export var RedisModule_GetApi: ?fn ([*c]const u8, ?*c_void) callconv(.C) c_int = undefined;
pub export var RedisModule_CreateCommand: ?fn (?*RedisModuleCtx, [*c]const u8, RedisModuleCmdFunc, [*c]const u8, c_int, c_int, c_int) callconv(.C) c_int = undefined;
pub export var RedisModule_SetModuleAttribs: ?fn (?*RedisModuleCtx, [*c]const u8, c_int, c_int) callconv(.C) c_int = undefined;
pub export var RedisModule_WrongArity: ?fn (?*RedisModuleCtx) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplyWithLongLong: ?fn (?*RedisModuleCtx, c_longlong) callconv(.C) c_int = undefined;
pub export var RedisModule_GetSelectedDb: ?fn (?*RedisModuleCtx) callconv(.C) c_int = undefined;
pub export var RedisModule_SelectDb: ?fn (?*RedisModuleCtx, c_int) callconv(.C) c_int = undefined;
pub export var RedisModule_OpenKey: ?fn (?*RedisModuleCtx, ?*RedisModuleString, c_int) callconv(.C) ?*c_void = undefined;
pub export var RedisModule_CloseKey: ?fn (?*RedisModuleKey) callconv(.C) void = undefined;
pub export var RedisModule_KeyType: ?fn (?*RedisModuleKey) callconv(.C) c_int = undefined;
pub export var RedisModule_ValueLength: ?fn (?*RedisModuleKey) callconv(.C) usize = undefined;
pub export var RedisModule_ListPush: ?fn (?*RedisModuleKey, c_int, ?*RedisModuleString) callconv(.C) c_int = undefined;
pub export var RedisModule_ListPop: ?fn (?*RedisModuleKey, c_int) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_Call: ?fn (?*RedisModuleCtx, [*c]const u8, [*c]const u8, ...) callconv(.C) ?*RedisModuleCallReply = undefined;
pub export var RedisModule_CallReplyProto: ?fn (?*RedisModuleCallReply, [*c]usize) callconv(.C) [*c]const u8 = undefined;
pub export var RedisModule_FreeCallReply: ?fn (?*RedisModuleCallReply) callconv(.C) void = undefined;
pub export var RedisModule_CallReplyType: ?fn (?*RedisModuleCallReply) callconv(.C) c_int = undefined;
pub export var RedisModule_CallReplyInteger: ?fn (?*RedisModuleCallReply) callconv(.C) c_longlong = undefined;
pub export var RedisModule_CallReplyLength: ?fn (?*RedisModuleCallReply) callconv(.C) usize = undefined;
pub export var RedisModule_CallReplyArrayElement: ?fn (?*RedisModuleCallReply, usize) callconv(.C) ?*RedisModuleCallReply = undefined;
pub export var RedisModule_CreateString: ?fn (?*RedisModuleCtx, [*c]const u8, usize) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_CreateStringFromLongLong: ?fn (?*RedisModuleCtx, c_longlong) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_CreateStringFromString: ?fn (?*RedisModuleCtx, ?*const RedisModuleString) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_CreateStringPrintf: ?fn (?*RedisModuleCtx, [*c]const u8, ...) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_FreeString: ?fn (?*RedisModuleCtx, ?*RedisModuleString) callconv(.C) void = undefined;
pub export var RedisModule_StringPtrLen: ?fn (?*const RedisModuleString, [*c]usize) callconv(.C) [*c]const u8 = undefined;
pub export var RedisModule_ReplyWithError: ?fn (?*RedisModuleCtx, [*c]const u8) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplyWithSimpleString: ?fn (?*RedisModuleCtx, [*c]const u8) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplyWithArray: ?fn (?*RedisModuleCtx, c_long) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplySetArrayLength: ?fn (?*RedisModuleCtx, c_long) callconv(.C) void = undefined;
pub export var RedisModule_ReplyWithStringBuffer: ?fn (?*RedisModuleCtx, [*c]const u8, usize) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplyWithString: ?fn (?*RedisModuleCtx, ?*RedisModuleString) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplyWithNull: ?fn (?*RedisModuleCtx) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplyWithDouble: ?fn (?*RedisModuleCtx, f64) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplyWithCallReply: ?fn (?*RedisModuleCtx, ?*RedisModuleCallReply) callconv(.C) c_int = undefined;
pub export var RedisModule_StringToLongLong: ?fn (?*const RedisModuleString, [*c]c_longlong) callconv(.C) c_int = undefined;
pub export var RedisModule_StringToDouble: ?fn (?*const RedisModuleString, [*c]f64) callconv(.C) c_int = undefined;
pub export var RedisModule_AutoMemory: ?fn (?*RedisModuleCtx) callconv(.C) void = undefined;
pub export var RedisModule_Replicate: ?fn (?*RedisModuleCtx, [*c]const u8, [*c]const u8, ...) callconv(.C) c_int = undefined;
pub export var RedisModule_ReplicateVerbatim: ?fn (?*RedisModuleCtx) callconv(.C) c_int = undefined;
pub export var RedisModule_CallReplyStringPtr: ?fn (?*RedisModuleCallReply, [*c]usize) callconv(.C) [*c]const u8 = undefined;
pub export var RedisModule_CreateStringFromCallReply: ?fn (?*RedisModuleCallReply) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_DeleteKey: ?fn (?*RedisModuleKey) callconv(.C) c_int = undefined;
pub export var RedisModule_StringSet: ?fn (?*RedisModuleKey, ?*RedisModuleString) callconv(.C) c_int = undefined;
pub export var RedisModule_StringDMA: ?fn (?*RedisModuleKey, [*c]usize, c_int) callconv(.C) [*c]u8 = undefined;
pub export var RedisModule_StringTruncate: ?fn (?*RedisModuleKey, usize) callconv(.C) c_int = undefined;
pub export var RedisModule_GetExpire: ?fn (?*RedisModuleKey) callconv(.C) mstime_t = undefined;
pub export var RedisModule_SetExpire: ?fn (?*RedisModuleKey, mstime_t) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetAdd: ?fn (?*RedisModuleKey, f64, ?*RedisModuleString, [*c]c_int) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetIncrby: ?fn (?*RedisModuleKey, f64, ?*RedisModuleString, [*c]c_int, [*c]f64) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetScore: ?fn (?*RedisModuleKey, ?*RedisModuleString, [*c]f64) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetRem: ?fn (?*RedisModuleKey, ?*RedisModuleString, [*c]c_int) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetRangeStop: ?fn (?*RedisModuleKey) callconv(.C) void = undefined;
pub export var RedisModule_ZsetFirstInScoreRange: ?fn (?*RedisModuleKey, f64, f64, c_int, c_int) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetLastInScoreRange: ?fn (?*RedisModuleKey, f64, f64, c_int, c_int) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetFirstInLexRange: ?fn (?*RedisModuleKey, ?*RedisModuleString, ?*RedisModuleString) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetLastInLexRange: ?fn (?*RedisModuleKey, ?*RedisModuleString, ?*RedisModuleString) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetRangeCurrentElement: ?fn (?*RedisModuleKey, [*c]f64) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_ZsetRangeNext: ?fn (?*RedisModuleKey) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetRangePrev: ?fn (?*RedisModuleKey) callconv(.C) c_int = undefined;
pub export var RedisModule_ZsetRangeEndReached: ?fn (?*RedisModuleKey) callconv(.C) c_int = undefined;
pub export var RedisModule_HashSet: ?fn (?*RedisModuleKey, c_int, ...) callconv(.C) c_int = undefined;
pub export var RedisModule_HashGet: ?fn (?*RedisModuleKey, c_int, ...) callconv(.C) c_int = undefined;
pub export var RedisModule_IsKeysPositionRequest: ?fn (?*RedisModuleCtx) callconv(.C) c_int = undefined;
pub export var RedisModule_KeyAtPos: ?fn (?*RedisModuleCtx, c_int) callconv(.C) void = undefined;
pub export var RedisModule_GetClientId: ?fn (?*RedisModuleCtx) callconv(.C) c_ulonglong = undefined;
pub export var RedisModule_PoolAlloc: ?fn (?*RedisModuleCtx, usize) callconv(.C) ?*c_void = undefined;
pub export var RedisModule_CreateDataType: ?fn (?*RedisModuleCtx, [*c]const u8, c_int, [*c]RedisModuleTypeMethods) callconv(.C) ?*RedisModuleType = undefined;
pub export var RedisModule_ModuleTypeSetValue: ?fn (?*RedisModuleKey, ?*RedisModuleType, ?*c_void) callconv(.C) c_int = undefined;
pub export var RedisModule_ModuleTypeGetType: ?fn (?*RedisModuleKey) callconv(.C) ?*RedisModuleType = undefined;
pub export var RedisModule_ModuleTypeGetValue: ?fn (?*RedisModuleKey) callconv(.C) ?*c_void = undefined;
pub export var RedisModule_SaveUnsigned: ?fn (?*RedisModuleIO, u64) callconv(.C) void = undefined;
pub export var RedisModule_LoadUnsigned: ?fn (?*RedisModuleIO) callconv(.C) u64 = undefined;
pub export var RedisModule_SaveSigned: ?fn (?*RedisModuleIO, i64) callconv(.C) void = undefined;
pub export var RedisModule_LoadSigned: ?fn (?*RedisModuleIO) callconv(.C) i64 = undefined;
pub export var RedisModule_EmitAOF: ?fn (?*RedisModuleIO, [*c]const u8, [*c]const u8, ...) callconv(.C) void = undefined;
pub export var RedisModule_SaveString: ?fn (?*RedisModuleIO, ?*RedisModuleString) callconv(.C) void = undefined;
pub export var RedisModule_SaveStringBuffer: ?fn (?*RedisModuleIO, [*c]const u8, usize) callconv(.C) void = undefined;
pub export var RedisModule_LoadString: ?fn (?*RedisModuleIO) callconv(.C) ?*RedisModuleString = undefined;
pub export var RedisModule_LoadStringBuffer: ?fn (?*RedisModuleIO, [*c]usize) callconv(.C) [*c]u8 = undefined;
pub export var RedisModule_SaveDouble: ?fn (?*RedisModuleIO, f64) callconv(.C) void = undefined;
pub export var RedisModule_LoadDouble: ?fn (?*RedisModuleIO) callconv(.C) f64 = undefined;
pub export var RedisModule_SaveFloat: ?fn (?*RedisModuleIO, f32) callconv(.C) void = undefined;
pub export var RedisModule_LoadFloat: ?fn (?*RedisModuleIO) callconv(.C) f32 = undefined;
pub export var RedisModule_Log: ?fn (?*RedisModuleCtx, [*c]const u8, [*c]const u8, ...) callconv(.C) void = undefined;
pub export var RedisModule_LogIOError: ?fn (?*RedisModuleIO, [*c]const u8, [*c]const u8, ...) callconv(.C) void = undefined;
pub export var RedisModule_StringAppendBuffer: ?fn (?*RedisModuleCtx, ?*RedisModuleString, [*c]const u8, usize) callconv(.C) c_int = undefined;
pub export var RedisModule_RetainString: ?fn (?*RedisModuleCtx, ?*RedisModuleString) callconv(.C) void = undefined;
pub export var RedisModule_StringCompare: ?fn (?*RedisModuleString, ?*RedisModuleString) callconv(.C) c_int = undefined;
pub export var RedisModule_GetContextFromIO: ?fn (?*RedisModuleIO) callconv(.C) ?*RedisModuleCtx = undefined;
pub export var RedisModule_BlockClient: ?fn (?*RedisModuleCtx, RedisModuleCmdFunc, RedisModuleCmdFunc, ?fn (?*c_void) callconv(.C) void, c_longlong) callconv(.C) ?*RedisModuleBlockedClient = undefined;
pub export var RedisModule_UnblockClient: ?fn (?*RedisModuleBlockedClient, ?*c_void) callconv(.C) c_int = undefined;
pub export var RedisModule_IsBlockedReplyRequest: ?fn (?*RedisModuleCtx) callconv(.C) c_int = undefined;
pub export var RedisModule_IsBlockedTimeoutRequest: ?fn (?*RedisModuleCtx) callconv(.C) c_int = undefined;
pub export var RedisModule_GetBlockedClientPrivateData: ?fn (?*RedisModuleCtx) callconv(.C) ?*c_void = undefined;
pub export var RedisModule_AbortBlock: ?fn (?*RedisModuleBlockedClient) callconv(.C) c_int = undefined;
pub export var RedisModule_Milliseconds: ?fn () callconv(.C) c_longlong = undefined;
pub fn RedisModule_Init(arg_ctx: ?*RedisModuleCtx, arg_name: [*c]const u8, arg_ver: c_int, arg_apiver: c_int) callconv(.C) c_int {
    var ctx = arg_ctx;
    var name = arg_name;
    var ver = arg_ver;
    var apiver = arg_apiver;
    var getapifuncptr: ?*c_void = (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), ctx)))[@intCast(c_uint, @as(c_int, 0))];
    RedisModule_GetApi = @intToPtr(?fn ([*c]const u8, ?*c_void) callconv(.C) c_int, @intCast(c_ulong, @ptrToInt(getapifuncptr)));
    _ = RedisModule_GetApi.?("RedisModule_Alloc", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Alloc)))));
    _ = RedisModule_GetApi.?("RedisModule_Calloc", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Calloc)))));
    _ = RedisModule_GetApi.?("RedisModule_Free", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Free)))));
    _ = RedisModule_GetApi.?("RedisModule_Realloc", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Realloc)))));
    _ = RedisModule_GetApi.?("RedisModule_Strdup", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Strdup)))));
    _ = RedisModule_GetApi.?("RedisModule_CreateCommand", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CreateCommand)))));
    _ = RedisModule_GetApi.?("RedisModule_SetModuleAttribs", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SetModuleAttribs)))));
    _ = RedisModule_GetApi.?("RedisModule_WrongArity", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_WrongArity)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithLongLong", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithLongLong)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithError", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithError)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithSimpleString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithSimpleString)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithArray", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithArray)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplySetArrayLength", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplySetArrayLength)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithStringBuffer", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithStringBuffer)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithString)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithNull", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithNull)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithCallReply", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithCallReply)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplyWithDouble", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplyWithDouble)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplySetArrayLength", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplySetArrayLength)))));
    _ = RedisModule_GetApi.?("RedisModule_GetSelectedDb", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_GetSelectedDb)))));
    _ = RedisModule_GetApi.?("RedisModule_SelectDb", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SelectDb)))));
    _ = RedisModule_GetApi.?("RedisModule_OpenKey", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_OpenKey)))));
    _ = RedisModule_GetApi.?("RedisModule_CloseKey", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CloseKey)))));
    _ = RedisModule_GetApi.?("RedisModule_KeyType", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_KeyType)))));
    _ = RedisModule_GetApi.?("RedisModule_ValueLength", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ValueLength)))));
    _ = RedisModule_GetApi.?("RedisModule_ListPush", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ListPush)))));
    _ = RedisModule_GetApi.?("RedisModule_ListPop", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ListPop)))));
    _ = RedisModule_GetApi.?("RedisModule_StringToLongLong", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringToLongLong)))));
    _ = RedisModule_GetApi.?("RedisModule_StringToDouble", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringToDouble)))));
    _ = RedisModule_GetApi.?("RedisModule_Call", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Call)))));
    _ = RedisModule_GetApi.?("RedisModule_CallReplyProto", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CallReplyProto)))));
    _ = RedisModule_GetApi.?("RedisModule_FreeCallReply", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_FreeCallReply)))));
    _ = RedisModule_GetApi.?("RedisModule_CallReplyInteger", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CallReplyInteger)))));
    _ = RedisModule_GetApi.?("RedisModule_CallReplyType", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CallReplyType)))));
    _ = RedisModule_GetApi.?("RedisModule_CallReplyLength", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CallReplyLength)))));
    _ = RedisModule_GetApi.?("RedisModule_CallReplyArrayElement", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CallReplyArrayElement)))));
    _ = RedisModule_GetApi.?("RedisModule_CallReplyStringPtr", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CallReplyStringPtr)))));
    _ = RedisModule_GetApi.?("RedisModule_CreateStringFromCallReply", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CreateStringFromCallReply)))));
    _ = RedisModule_GetApi.?("RedisModule_CreateString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CreateString)))));
    _ = RedisModule_GetApi.?("RedisModule_CreateStringFromLongLong", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CreateStringFromLongLong)))));
    _ = RedisModule_GetApi.?("RedisModule_CreateStringFromString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CreateStringFromString)))));
    _ = RedisModule_GetApi.?("RedisModule_CreateStringPrintf", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CreateStringPrintf)))));
    _ = RedisModule_GetApi.?("RedisModule_FreeString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_FreeString)))));
    _ = RedisModule_GetApi.?("RedisModule_StringPtrLen", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringPtrLen)))));
    _ = RedisModule_GetApi.?("RedisModule_AutoMemory", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_AutoMemory)))));
    _ = RedisModule_GetApi.?("RedisModule_Replicate", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Replicate)))));
    _ = RedisModule_GetApi.?("RedisModule_ReplicateVerbatim", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ReplicateVerbatim)))));
    _ = RedisModule_GetApi.?("RedisModule_DeleteKey", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_DeleteKey)))));
    _ = RedisModule_GetApi.?("RedisModule_StringSet", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringSet)))));
    _ = RedisModule_GetApi.?("RedisModule_StringDMA", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringDMA)))));
    _ = RedisModule_GetApi.?("RedisModule_StringTruncate", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringTruncate)))));
    _ = RedisModule_GetApi.?("RedisModule_GetExpire", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_GetExpire)))));
    _ = RedisModule_GetApi.?("RedisModule_SetExpire", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SetExpire)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetAdd", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetAdd)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetIncrby", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetIncrby)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetScore", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetScore)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetRem", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetRem)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetRangeStop", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetRangeStop)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetFirstInScoreRange", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetFirstInScoreRange)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetLastInScoreRange", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetLastInScoreRange)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetFirstInLexRange", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetFirstInLexRange)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetLastInLexRange", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetLastInLexRange)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetRangeCurrentElement", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetRangeCurrentElement)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetRangeNext", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetRangeNext)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetRangePrev", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetRangePrev)))));
    _ = RedisModule_GetApi.?("RedisModule_ZsetRangeEndReached", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ZsetRangeEndReached)))));
    _ = RedisModule_GetApi.?("RedisModule_HashSet", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_HashSet)))));
    _ = RedisModule_GetApi.?("RedisModule_HashGet", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_HashGet)))));
    _ = RedisModule_GetApi.?("RedisModule_IsKeysPositionRequest", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_IsKeysPositionRequest)))));
    _ = RedisModule_GetApi.?("RedisModule_KeyAtPos", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_KeyAtPos)))));
    _ = RedisModule_GetApi.?("RedisModule_GetClientId", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_GetClientId)))));
    _ = RedisModule_GetApi.?("RedisModule_PoolAlloc", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_PoolAlloc)))));
    _ = RedisModule_GetApi.?("RedisModule_CreateDataType", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_CreateDataType)))));
    _ = RedisModule_GetApi.?("RedisModule_ModuleTypeSetValue", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ModuleTypeSetValue)))));
    _ = RedisModule_GetApi.?("RedisModule_ModuleTypeGetType", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ModuleTypeGetType)))));
    _ = RedisModule_GetApi.?("RedisModule_ModuleTypeGetValue", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_ModuleTypeGetValue)))));
    _ = RedisModule_GetApi.?("RedisModule_SaveUnsigned", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SaveUnsigned)))));
    _ = RedisModule_GetApi.?("RedisModule_LoadUnsigned", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_LoadUnsigned)))));
    _ = RedisModule_GetApi.?("RedisModule_SaveSigned", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SaveSigned)))));
    _ = RedisModule_GetApi.?("RedisModule_LoadSigned", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_LoadSigned)))));
    _ = RedisModule_GetApi.?("RedisModule_SaveString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SaveString)))));
    _ = RedisModule_GetApi.?("RedisModule_SaveStringBuffer", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SaveStringBuffer)))));
    _ = RedisModule_GetApi.?("RedisModule_LoadString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_LoadString)))));
    _ = RedisModule_GetApi.?("RedisModule_LoadStringBuffer", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_LoadStringBuffer)))));
    _ = RedisModule_GetApi.?("RedisModule_SaveDouble", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SaveDouble)))));
    _ = RedisModule_GetApi.?("RedisModule_LoadDouble", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_LoadDouble)))));
    _ = RedisModule_GetApi.?("RedisModule_SaveFloat", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_SaveFloat)))));
    _ = RedisModule_GetApi.?("RedisModule_LoadFloat", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_LoadFloat)))));
    _ = RedisModule_GetApi.?("RedisModule_EmitAOF", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_EmitAOF)))));
    _ = RedisModule_GetApi.?("RedisModule_Log", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Log)))));
    _ = RedisModule_GetApi.?("RedisModule_LogIOError", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_LogIOError)))));
    _ = RedisModule_GetApi.?("RedisModule_StringAppendBuffer", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringAppendBuffer)))));
    _ = RedisModule_GetApi.?("RedisModule_RetainString", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_RetainString)))));
    _ = RedisModule_GetApi.?("RedisModule_StringCompare", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_StringCompare)))));
    _ = RedisModule_GetApi.?("RedisModule_GetContextFromIO", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_GetContextFromIO)))));
    _ = RedisModule_GetApi.?("RedisModule_BlockClient", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_BlockClient)))));
    _ = RedisModule_GetApi.?("RedisModule_UnblockClient", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_UnblockClient)))));
    _ = RedisModule_GetApi.?("RedisModule_IsBlockedReplyRequest", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_IsBlockedReplyRequest)))));
    _ = RedisModule_GetApi.?("RedisModule_IsBlockedTimeoutRequest", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_IsBlockedTimeoutRequest)))));
    _ = RedisModule_GetApi.?("RedisModule_GetBlockedClientPrivateData", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_GetBlockedClientPrivateData)))));
    _ = RedisModule_GetApi.?("RedisModule_AbortBlock", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_AbortBlock)))));
    _ = RedisModule_GetApi.?("RedisModule_Milliseconds", @ptrCast(?*c_void, (@ptrCast([*c]?*c_void, @alignCast(@alignOf(?*c_void), &RedisModule_Milliseconds)))));
    _ = RedisModule_SetModuleAttribs.?(ctx, name, ver, apiver);
    return 0;
}
pub const __INTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UINTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_unsigned = void }");
pub const __PTRDIFF_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __INTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __SIZE_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_unsigned = void }");
pub const __WINT_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __CHAR16_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_short = void }");
pub const __CHAR32_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UINTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_unsigned = void }");
pub const __INT8_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_signed = void }");
pub const __INT64_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UINT8_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_char = void }");
pub const __UINT16_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_short = void }");
pub const __UINT32_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UINT64_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_unsigned = void }");
pub const __INT_LEAST8_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_signed = void }");
pub const __UINT_LEAST8_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_char = void }");
pub const __UINT_LEAST16_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_short = void }");
pub const __UINT_LEAST32_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __INT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UINT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_unsigned = void }");
pub const __INT_FAST8_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_signed = void }");
pub const __UINT_FAST8_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_char = void }");
pub const __UINT_FAST16_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_short = void }");
pub const __UINT_FAST32_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __INT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UINT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_unsigned = void }");
pub const __GLIBC_USE = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const __STRING = @compileError("unable to translate C expr: unexpected token Id{ .Hash = void }");
pub const __ptr_t = @compileError("unable to translate C expr: unexpected token Id{ .Nl = void }");
pub const __warndecl = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_extern = void }");
pub const __warnattr = @compileError("unable to translate C expr: unexpected token Id{ .Nl = void }");
pub const __errordecl = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_extern = void }");
pub const __flexarr = @compileError("unable to translate C expr: unexpected token Id{ .LBracket = void }");
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token Id{ .Hash = void }");
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token Id{ .Hash = void }");
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token Id{ .Hash = void }");
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token Id{ .Nl = void }");
pub const __extern_inline = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_extern = void }");
pub const __extern_always_inline = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_extern = void }");
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token Id{ .Nl = void }");
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token Id{ .Nl = void }");
pub const __glibc_macro_warning1 = @compileError("unable to translate C expr: unexpected token Id{ .Hash = void }");
pub const __S16_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __U16_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_short = void }");
pub const __U32_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __SLONGWORD_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __ULONGWORD_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_long = void }");
pub const __SQUAD_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UQUAD_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_long = void }");
pub const __SWORD_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __UWORD_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_long = void }");
pub const __ULONG32_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __S64_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_int = void }");
pub const __U64_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_long = void }");
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_typedef = void }");
pub const __TIMER_T_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Nl = void }");
pub const __FSID_T_TYPE = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_struct = void }");
pub const __FD_ZERO = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_do = void }");
pub const __FD_SET = @compileError("unable to translate C expr: expected ')''");
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')''");
pub const _SIGSET_NWORDS = @compileError("unable to translate C expr: unexpected token Id{ .Keyword_sizeof = void }");
pub const __NFDBITS = @compileError("unable to translate C expr: expected ')'' instead got: Keyword_sizeof");
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token Id{ .LBrace = void }");
pub const __PTHREAD_RWLOCK_ELISION_EXTRA = @compileError("unable to translate C expr: unexpected token Id{ .LBrace = void }");
pub const __INT64_C = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const __UINT64_C = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const INT64_C = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const UINT32_C = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const UINT64_C = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const INTMAX_C = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const UINTMAX_C = @compileError("unable to translate C expr: unexpected token Id{ .HashHash = void }");
pub const __getc_unlocked_body = @compileError("unable to translate C expr: expected ':'");
pub const __putc_unlocked_body = @compileError("unable to translate C expr: expected ':'");
pub const REDISMODULE_HASH_DELETE = @compileError("unable to translate C expr: expected ')'' instead got: IntegerLiteral");
pub const REDISMODULE_GET_API = @compileError("unable to translate C expr: expected ',' or ')'");
pub const __AVX__ = 1;
pub const __WORDSIZE_TIME64_COMPAT32 = 1;
pub const __FINITE_MATH_ONLY__ = 0;
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const REDISMODULE_REPLY_ARRAY = 3;
pub const __tune_corei7__ = 1;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT64_FMTX__ = "lX";
pub inline fn va_start(ap: var, param: var) @TypeOf(__builtin_va_start(ap, param)) {
    return __builtin_va_start(ap, param);
}
pub const __SSE4_2__ = 1;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub inline fn __GNUC_PREREQ(maj: var, min: var) @TypeOf((__GNUC__ << 16) + @boolToInt(__GNUC_MINOR__ >= ((maj << 16) + min))) {
    return (__GNUC__ << 16) + @boolToInt(__GNUC_MINOR__ >= ((maj << 16) + min));
}
pub const __INT_FAST32_FMTd__ = "d";
pub const __STDC_UTF_16__ = 1;
pub const __LDBL_HAS_DENORM__ = 1;
pub const __INTMAX_FMTi__ = "li";
pub const __FMA__ = 1;
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT32_MAX__ = @as(c_uint, 4294967295);
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub inline fn htobe64(x: var) @TypeOf(__bswap_64(x)) {
    return __bswap_64(x);
}
pub const __INT_MAX__ = 2147483647;
pub const __INT_LEAST64_MAX__ = @as(c_long, 9223372036854775807);
pub const __USE_FORTIFY_LEVEL = 0;
pub const __RLIM_T_MATCHES_RLIM64_T = 1;
pub const __SIZEOF_INT128__ = 16;
pub const __INT64_MAX__ = @as(c_long, 9223372036854775807);
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __INT_FAST16_FMTd__ = "hd";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT8_FMTu__ = "hhu";
pub const __INT_FAST16_MAX__ = 32767;
pub inline fn le16toh(x: var) @TypeOf(__uint16_identity(x)) {
    return __uint16_identity(x);
}
pub const __INVPCID__ = 1;
pub const __SIZE_FMTx__ = "lx";
pub const __UINT8_FMTX__ = "hhX";
pub const _BITS_BYTESWAP_H = 1;
pub const INT_FAST32_MAX = @as(c_long, 9223372036854775807);
pub const __CLFLUSHOPT__ = 1;
pub const P_tmpdir = "/tmp";
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __ELF__ = 1;
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __DBL_HAS_DENORM__ = 1;
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __SSSE3__ = 1;
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub inline fn __glibc_likely(cond: var) @TypeOf(__builtin_expect(cond, 1)) {
    return __builtin_expect(cond, 1);
}
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __STDIO_INLINE = __extern_inline;
pub const __UINT_FAST16_FMTu__ = "hu";
pub const SEEK_END = 2;
pub const __SSP_STRONG__ = 2;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const __clang_patchlevel__ = 0;
pub inline fn htobe32(x: var) @TypeOf(__bswap_32(x)) {
    return __bswap_32(x);
}
pub const __UINT64_FMTu__ = "lu";
pub const _IONBF = 2;
pub const INT_FAST32_MIN = -@as(c_long, 9223372036854775807) - 1;
pub const __LDBL_DIG__ = 18;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __MMX__ = 1;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const __SIZEOF_WINT_T__ = 4;
pub const __STDC_IEC_559_COMPLEX__ = 1;
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub inline fn FD_ISSET(fd: var, fdsetp: var) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    return __FD_ISSET(fd, fdsetp);
}
pub const __LITTLE_ENDIAN__ = 1;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __INO_T_MATCHES_INO64_T = 1;
pub inline fn __attribute_deprecated_msg__(msg: var) @TypeOf(__attribute__(__deprecated__(msg))) {
    return __attribute__(__deprecated__(msg));
}
pub inline fn REDISMODULE_NOT_USED(V: var) @TypeOf((if (@typeInfo(@TypeOf(V)) == .Pointer) @ptrCast(c_void, @alignCast(@alignOf(c_void.Child), V)) else if (@typeInfo(@TypeOf(V)) == .Int and @typeInfo(c_void) == .Pointer) @intToPtr(c_void, V) else @as(c_void, V))) {
    return (if (@typeInfo(@TypeOf(V)) == .Pointer) @ptrCast(c_void, @alignCast(@alignOf(c_void.Child), V)) else if (@typeInfo(@TypeOf(V)) == .Int and @typeInfo(c_void) == .Pointer) @intToPtr(c_void, V) else @as(c_void, V));
}
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __VERSION__ = "Clang 10.0.0 ";
pub const __DBL_HAS_INFINITY__ = 1;
pub const _BITS_PTHREADTYPES_ARCH_H = 1;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __GNUC_MINOR__ = 2;
pub const _STDINT_H = 1;
pub const __corei7 = 1;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const __UINT_FAST32_FMTu__ = "u";
pub const INT_LEAST16_MAX = 32767;
pub const WCHAR_MIN = __WCHAR_MIN;
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const _DEFAULT_SOURCE = 1;
pub const __pic__ = 2;
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 0;
pub const __FLT_HAS_INFINITY__ = 1;
pub const UINT_FAST32_MAX = @as(c_ulong, 18446744073709551615);
pub const __unix__ = 1;
pub const EOF = -1;
pub inline fn __bswap_constant_32(x: var) @TypeOf(((x & @as(c_uint, 0xff000000)) >> 24) | (((x & @as(c_uint, 0x00ff0000)) >> 8) | (((x & @as(c_uint, 0x0000ff00)) << 8) | ((x & @as(c_uint, 0x000000ff)) << 24)))) {
    return ((x & @as(c_uint, 0xff000000)) >> 24) | (((x & @as(c_uint, 0x00ff0000)) >> 8) | (((x & @as(c_uint, 0x0000ff00)) << 8) | ((x & @as(c_uint, 0x000000ff)) << 24)));
}
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub inline fn __va_copy(d: var, s: var) @TypeOf(__builtin_va_copy(d, s)) {
    return __builtin_va_copy(d, s);
}
pub const __restrict_arr = __restrict;
pub const __ADX__ = 1;
pub inline fn be32toh(x: var) @TypeOf(__bswap_32(x)) {
    return __bswap_32(x);
}
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = 4;
pub const INT8_MAX = 127;
pub const __UINT_LEAST32_FMTo__ = "o";
pub inline fn FD_ZERO(fdsetp: var) @TypeOf(__FD_ZERO(fdsetp)) {
    return __FD_ZERO(fdsetp);
}
pub const __glibc_c99_flexarr_available = 1;
pub const SEEK_SET = 0;
pub const __UINT_LEAST32_MAX__ = @as(c_uint, 4294967295);
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __SIZEOF_PTHREAD_ATTR_T = 56;
pub const UINT_FAST8_MAX = 255;
pub inline fn htole16(x: var) @TypeOf(__uint16_identity(x)) {
    return __uint16_identity(x);
}
pub const __USE_XOPEN2K = 1;
pub const __clang_version__ = "10.0.0 ";
pub const __INTMAX_FMTd__ = "ld";
pub const __SEG_FS = 1;
pub const TMP_MAX = 238328;
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const _____fpos64_t_defined = 1;
pub const _IO_EOF_SEEN = 0x0010;
pub const REDISMODULE_ERRORMSG_WRONGTYPE = "WRONGTYPE Operation against a key holding the wrong kind of value";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __WCHAR_WIDTH__ = 32;
pub const __UINT16_FMTX__ = "hX";
pub const UINT_LEAST8_MAX = 255;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const unix = 1;
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const _STRUCT_TIMESPEC = 1;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __INT_LEAST16_TYPE__ = c_short;
pub inline fn FD_SET(fd: var, fdsetp: var) @TypeOf(__FD_SET(fd, fdsetp)) {
    return __FD_SET(fd, fdsetp);
}
pub const __SSE3__ = 1;
pub const FOPEN_MAX = 16;
pub const INT32_MAX = 2147483647;
pub const INT_FAST8_MAX = 127;
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const INT16_MIN = -32767 - 1;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __SSE2__ = 1;
pub const _ATFILE_SOURCE = 1;
pub const __STDC__ = 1;
pub const __attribute_warn_unused_result__ = __attribute__(__warn_unused_result__);
pub const _BITS_ENDIAN_H = 1;
pub const REDISMODULE_TYPE_METHOD_VERSION = 1;
pub const _BITS_PTHREADTYPES_COMMON_H = 1;
pub const __LONG_MAX__ = @as(c_long, 9223372036854775807);
pub const __MODE_T_TYPE = __U32_TYPE;
pub inline fn __bswap_constant_64(x: var) @TypeOf(((x & @as(c_ulonglong, 0xff00000000000000)) >> 56) | (((x & @as(c_ulonglong, 0x00ff000000000000)) >> 40) | (((x & @as(c_ulonglong, 0x0000ff0000000000)) >> 24) | (((x & @as(c_ulonglong, 0x000000ff00000000)) >> 8) | (((x & @as(c_ulonglong, 0x00000000ff000000)) << 8) | (((x & @as(c_ulonglong, 0x0000000000ff0000)) << 24) | (((x & @as(c_ulonglong, 0x000000000000ff00)) << 40) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << 56)))))))) {
    return ((x & @as(c_ulonglong, 0xff00000000000000)) >> 56) | (((x & @as(c_ulonglong, 0x00ff000000000000)) >> 40) | (((x & @as(c_ulonglong, 0x0000ff0000000000)) >> 24) | (((x & @as(c_ulonglong, 0x000000ff00000000)) >> 8) | (((x & @as(c_ulonglong, 0x00000000ff000000)) << 8) | (((x & @as(c_ulonglong, 0x0000000000ff0000)) << 24) | (((x & @as(c_ulonglong, 0x000000000000ff00)) << 40) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << 56)))))));
}
pub const __FSGSBASE__ = 1;
pub const __INTPTR_MAX__ = @as(c_long, 9223372036854775807);
pub const __INTMAX_WIDTH__ = 64;
pub const REDISMODULE_KEYTYPE_ZSET = 5;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __PID_T_TYPE = __S32_TYPE;
pub const __x86_64 = 1;
pub const REDISMODULE_ZADD_NX = 1 << 1;
pub const __INT8_FMTd__ = "hhd";
pub const __UINTMAX_WIDTH__ = 64;
pub const REDISMODULE_ZADD_XX = 1 << 0;
pub const __UINT8_MAX__ = 255;
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __clang_minor__ = 0;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __STATFS_MATCHES_STATFS64 = 1;
pub const __always_inline = __inline ++ __attribute__(__always_inline__);
pub const REDISMODULE_KEYTYPE_LIST = 2;
pub const __SSE4_1__ = 1;
pub const __WCHAR_TYPE__ = c_int;
pub const __INT_FAST64_FMTd__ = "ld";
pub const _STDIO_H = 1;
pub const NFDBITS = __NFDBITS;
pub const INT_LEAST64_MIN = -__INT64_C(9223372036854775807) - 1;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __INT16_FMTi__ = "hi";
pub const __LDBL_MIN_EXP__ = -16381;
pub const __PRFCHW__ = 1;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __UINTMAX_FMTu__ = "lu";
pub const L_tmpnam = 20;
pub const __UINT32_FMTu__ = "u";
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const __amd64__ = 1;
pub const __USE_EXTERN_INLINES = 1;
pub const __INT64_C_SUFFIX__ = L;
pub inline fn INT16_C(c: var) @TypeOf(c) {
    return c;
}
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: var) @TypeOf(__flags) {
    return blk: {
        _ = 0;
        _ = 0;
        _ = 0;
        _ = 0;
        _ = 0;
        _ = 0;
        _ = 0;
        _ = 0;
        _ = __PTHREAD_RWLOCK_ELISION_EXTRA;
        _ = 0;
        break :blk __flags;
    };
}
pub const _BITS_TYPESIZES_H = 1;
pub const _IOLBF = 1;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub inline fn __P(args: var) @TypeOf(args) {
    return args;
}
pub const __UINT64_FMTx__ = "lx";
pub inline fn __LONG_LONG_PAIR(HI: var, LO: var) @TypeOf(HI) {
    return blk: {
        _ = LO;
        break :blk HI;
    };
}
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __GNUC__ = 4;
pub const __INT_FAST32_FMTi__ = "i";
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub inline fn __LDBL_REDIR1_NTH(name: var, proto: var, alias: var) @TypeOf(name ++ (proto ++ __THROW)) {
    return name ++ (proto ++ __THROW);
}
pub const __seg_gs = __attribute__(address_space(256));
pub const __UINT64_FMTo__ = "lo";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const REDISMODULE_NEGATIVE_INFINITE = -1.0 / 0.0;
pub const _THREAD_SHARED_TYPES_H = 1;
pub const __GLIBC_USE_DEPRECATED_SCANF = 0;
pub const __attribute_used__ = __attribute__(__used__);
pub const __FD_ZERO_STOS = "stosq";
pub inline fn INT32_C(c: var) @TypeOf(c) {
    return c;
}
pub const __STDC_UTF_32__ = 1;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const _SYS_CDEFS_H = 1;
pub inline fn __glibc_clang_prereq(maj: var, min: var) @TypeOf((__clang_major__ << 16) + @boolToInt(__clang_minor__ >= ((maj << 16) + min))) {
    return (__clang_major__ << 16) + @boolToInt(__clang_minor__ >= ((maj << 16) + min));
}
pub const UINT32_MAX = @as(c_uint, 4294967295);
pub const __UINT16_FMTu__ = "hu";
pub const REDISMODULE_ZADD_UPDATED = 1 << 3;
pub const INT_LEAST8_MIN = -128;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __DBL_DIG__ = 15;
pub inline fn va_copy(dest: var, src: var) @TypeOf(__builtin_va_copy(dest, src)) {
    return __builtin_va_copy(dest, src);
}
pub const __PTHREAD_MUTEX_HAVE_PREV = 1;
pub const __INT32_FMTd__ = "d";
pub const __sigset_t_defined = 1;
pub const __INT_LEAST32_FMTd__ = "d";
pub const __USE_POSIX199506 = 1;
pub const REDISMODULE_POSTPONED_ARRAY_LEN = -1;
pub inline fn __bos(ptr: var) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > 1)) {
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > 1);
}
pub const __FLT_DIG__ = 6;
pub const __INTPTR_FMTi__ = "li";
pub const __UINT_FAST64_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;
pub const __GID_T_TYPE = __U32_TYPE;
pub const _____fpos_t_defined = 1;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const INT_LEAST64_MAX = __INT64_C(9223372036854775807);
pub const __INT32_TYPE__ = c_int;
pub const __UINTPTR_FMTX__ = "lX";
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __DBL_MIN_EXP__ = -1021;
pub const __INT_FAST64_FMTi__ = "li";
pub const __INT64_FMTi__ = "li";
pub const __attribute_const__ = __attribute__(__const__);
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const INT_LEAST32_MAX = 2147483647;
pub const REDISMODULE_HASH_NONE = 0;
pub const FILENAME_MAX = 4096;
pub const BUFSIZ = 8192;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __GLIBC_USE_LIB_EXT2 = 0;
pub inline fn __NTHNL(fct: var) @TypeOf(__attribute__(__nothrow__) ++ fct) {
    return __attribute__(__nothrow__) ++ fct;
}
pub const __timeval_defined = 1;
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __UINT_LEAST32_FMTX__ = "X";
pub inline fn __nonnull(params: var) @TypeOf(__attribute__(__nonnull__ ++ params)) {
    return __attribute__(__nonnull__ ++ params);
}
pub const __SSE_MATH__ = 1;
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const SIG_ATOMIC_MAX = 2147483647;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub inline fn __glibc_unlikely(cond: var) @TypeOf(__builtin_expect(cond, 0)) {
    return __builtin_expect(cond, 0);
}
pub const _SYS_SELECT_H = 1;
pub inline fn __glibc_has_attribute(attr: var) @TypeOf(__has_attribute(attr)) {
    return __has_attribute(attr);
}
pub const __INT16_TYPE__ = c_short;
pub const __PCLMUL__ = 1;
pub const __UINTPTR_FMTx__ = "lx";
pub const __WCHAR_MIN = -__WCHAR_MAX - 1;
pub const __AES__ = 1;
pub const __S32_TYPE = c_int;
pub const __FLT_RADIX__ = 2;
pub const __FD_SETSIZE = 1024;
pub const FD_SETSIZE = __FD_SETSIZE;
pub const __amd64 = 1;
pub const INT_LEAST8_MAX = 127;
pub const _IOFBF = 0;
pub inline fn __attribute_format_strfmon__(a: var, b: var) @TypeOf(__attribute__(__format__(__strfmon__, a, b))) {
    return __attribute__(__format__(__strfmon__, a, b));
}
pub const __UINTPTR_FMTo__ = "lo";
pub const __INT32_MAX__ = 2147483647;
pub const __INTPTR_FMTd__ = "ld";
pub inline fn va_arg(ap: var, type_1: var) @TypeOf(__builtin_va_arg(ap, type_1)) {
    return __builtin_va_arg(ap, type_1);
}
pub const __INT_FAST32_MAX__ = 2147483647;
pub const _BITS_TIME64_H = 1;
pub const __INT32_FMTi__ = "i";
pub inline fn __bswap_constant_16(x: var) @TypeOf((if (@typeInfo(@TypeOf(((x >> 8) & 0xff) | ((x & 0xff) << 8))) == .Pointer) @ptrCast(__uint16_t, @alignCast(@alignOf(__uint16_t.Child), ((x >> 8) & 0xff) | ((x & 0xff) << 8))) else if (@typeInfo(@TypeOf(((x >> 8) & 0xff) | ((x & 0xff) << 8))) == .Int and @typeInfo(__uint16_t) == .Pointer) @intToPtr(__uint16_t, ((x >> 8) & 0xff) | ((x & 0xff) << 8)) else @as(__uint16_t, ((x >> 8) & 0xff) | ((x & 0xff) << 8)))) {
    return (if (@typeInfo(@TypeOf(((x >> 8) & 0xff) | ((x & 0xff) << 8))) == .Pointer) @ptrCast(__uint16_t, @alignCast(@alignOf(__uint16_t.Child), ((x >> 8) & 0xff) | ((x & 0xff) << 8))) else if (@typeInfo(@TypeOf(((x >> 8) & 0xff) | ((x & 0xff) << 8))) == .Int and @typeInfo(__uint16_t) == .Pointer) @intToPtr(__uint16_t, ((x >> 8) & 0xff) | ((x & 0xff) << 8)) else @as(__uint16_t, ((x >> 8) & 0xff) | ((x & 0xff) << 8)));
}
pub const __USE_ISOC11 = 1;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __MOVBE__ = 1;
pub const __INT_LEAST32_TYPE__ = c_int;
pub inline fn __REDIRECT_LDBL(name: var, proto: var, alias: var) @TypeOf(__REDIRECT(name, proto, alias)) {
    return __REDIRECT(name, proto, alias);
}
pub const UINT_LEAST16_MAX = 65535;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __SIZE_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __INT_FAST64_MAX__ = @as(c_long, 9223372036854775807);
pub const SIG_ATOMIC_MIN = -2147483647 - 1;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __UINTPTR_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __UINT_FAST32_FMTx__ = "x";
pub inline fn __ASMNAME2(prefix: var, cname: var) @TypeOf(__STRING(prefix) ++ cname) {
    return __STRING(prefix) ++ cname;
}
pub const __PTRDIFF_FMTd__ = "ld";
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __WCHAR_MAX__ = 2147483647;
pub const __ATOMIC_SEQ_CST = 5;
pub inline fn UINT8_C(c: var) @TypeOf(c) {
    return c;
}
pub const __THROW = __attribute__(__nothrow__ ++ __LEAF);
pub const __THROWNL = __attribute__(__nothrow__);
pub const REDISMODULE_HASH_XX = 1 << 1;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const L_ctermid = 9;
pub const UINTMAX_MAX = __UINT64_C(18446744073709551615);
pub const __x86_64__ = 1;
pub const __BMI__ = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const __BIT_TYPES_DEFINED__ = 1;
pub const ____mbstate_t_defined = 1;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZEOF_DOUBLE__ = 8;
pub const __USE_ATFILE = 1;
pub inline fn __NTH(fct: var) @TypeOf(__attribute__(__nothrow__ ++ __LEAF) ++ fct) {
    return __attribute__(__nothrow__ ++ __LEAF) ++ fct;
}
pub const __USE_POSIX_IMPLICITLY = 1;
pub const __UINT64_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __SYSCALL_WORDSIZE = 64;
pub const __SIZEOF_FLOAT__ = 4;
pub const __SEG_GS = 1;
pub const INT_FAST64_MAX = __INT64_C(9223372036854775807);
pub inline fn __FD_ISSET(d: var, set: var) @TypeOf((__FDS_BITS(set)[__FD_ELT(d)] & __FD_MASK(d)) != 0) {
    return (__FDS_BITS(set)[__FD_ELT(d)] & __FD_MASK(d)) != 0;
}
pub const __INT_FAST8_MAX__ = 127;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __USE_POSIX2 = 1;
pub inline fn __glibc_macro_warning(message: var) @TypeOf(__glibc_macro_warning1(GCC ++ (warning ++ message))) {
    return __glibc_macro_warning1(GCC ++ (warning ++ message));
}
pub const __SIZEOF_PTHREAD_CONDATTR_T = 4;
pub inline fn __FD_MASK(d: var) @TypeOf((if (@typeInfo(@TypeOf(@as(c_ulong, 1) << (d % __NFDBITS))) == .Pointer) @ptrCast(__fd_mask, @alignCast(@alignOf(__fd_mask.Child), @as(c_ulong, 1) << (d % __NFDBITS))) else if (@typeInfo(@TypeOf(@as(c_ulong, 1) << (d % __NFDBITS))) == .Int and @typeInfo(__fd_mask) == .Pointer) @intToPtr(__fd_mask, @as(c_ulong, 1) << (d % __NFDBITS)) else @as(__fd_mask, @as(c_ulong, 1) << (d % __NFDBITS)))) {
    return (if (@typeInfo(@TypeOf(@as(c_ulong, 1) << (d % __NFDBITS))) == .Pointer) @ptrCast(__fd_mask, @alignCast(@alignOf(__fd_mask.Child), @as(c_ulong, 1) << (d % __NFDBITS))) else if (@typeInfo(@TypeOf(@as(c_ulong, 1) << (d % __NFDBITS))) == .Int and @typeInfo(__fd_mask) == .Pointer) @intToPtr(__fd_mask, @as(c_ulong, 1) << (d % __NFDBITS)) else @as(__fd_mask, @as(c_ulong, 1) << (d % __NFDBITS)));
}
pub const __SSE__ = 1;
pub const REDISMODULE_KEYTYPE_STRING = 1;
pub const __NO_MATH_INLINES = 1;
pub const __SIZEOF_FLOAT128__ = 16;
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __UINT_FAST16_MAX__ = 65535;
pub inline fn REDISMODULE_API_FUNC(x: var) @TypeOf(x.*) {
    return x.*;
}
pub const __ATOMIC_ACQUIRE = 2;
pub const _FEATURES_H = 1;
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = 4;
pub const INT_FAST8_MIN = -128;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const REDISMODULE_KEYTYPE_HASH = 3;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __attribute_pure__ = __attribute__(__pure__);
pub const __PDP_ENDIAN = 3412;
pub inline fn htole32(x: var) @TypeOf(__uint32_identity(x)) {
    return __uint32_identity(x);
}
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub inline fn __bos0(ptr: var) @TypeOf(__builtin_object_size(ptr, 0)) {
    return __builtin_object_size(ptr, 0);
}
pub const __LP64__ = 1;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __SIZEOF_PTHREAD_MUTEX_T = 40;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __PTRDIFF_FMTi__ = "li";
pub const __DBL_MAX_10_EXP__ = 308;
pub const __STDC_IEC_559__ = 1;
pub inline fn __REDIRECT_NTH_LDBL(name: var, proto: var, alias: var) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __SIZEOF_LONG__ = 8;
pub const __FLT_MIN_EXP__ = -125;
pub inline fn __ferror_unlocked_body(_fp: var) @TypeOf(((_fp.*._flags) & _IO_ERR_SEEN) != 0) {
    return ((_fp.*._flags) & _IO_ERR_SEEN) != 0;
}
pub const INT_FAST16_MAX = @as(c_long, 9223372036854775807);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __FLT_EVAL_METHOD__ = 0;
pub const __UINTMAX_FMTx__ = "lx";
pub const __code_model_small_ = 1;
pub const _LP64 = 1;
pub const __FLT_MAX_EXP__ = 128;
pub const UINT8_MAX = 255;
pub const __WINT_UNSIGNED__ = 1;
pub const __GNU_LIBRARY__ = 6;
pub const SIZE_MAX = @as(c_ulong, 18446744073709551615);
pub const REDISMODULE_KEYTYPE_MODULE = 6;
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const REDISMODULE_KEYTYPE_SET = 4;
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const REDISMODULE_REPLY_INTEGER = 2;
pub const __SIZEOF_PTHREAD_RWLOCK_T = 56;
pub const REDISMODULE_LIST_HEAD = 0;
pub const _THREAD_MUTEX_INTERNAL_H = 1;
pub const __UINT_FAST32_FMTX__ = "X";
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __LZCNT__ = 1;
pub inline fn __glibc_clang_has_extension(ext: var) @TypeOf(__has_extension(ext)) {
    return __has_extension(ext);
}
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const _BITS_TYPES_H = 1;
pub const __SIZEOF_PTHREAD_BARRIER_T = 32;
pub const UINT_FAST64_MAX = __UINT64_C(18446744073709551615);
pub const __SIZEOF_SHORT__ = 2;
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub inline fn le64toh(x: var) @TypeOf(__uint64_identity(x)) {
    return __uint64_identity(x);
}
pub inline fn __GLIBC_PREREQ(maj: var, min: var) @TypeOf((__GLIBC__ << 16) + @boolToInt(__GLIBC_MINOR__ >= ((maj << 16) + min))) {
    return (__GLIBC__ << 16) + @boolToInt(__GLIBC_MINOR__ >= ((maj << 16) + min));
}
pub const __INTMAX_C_SUFFIX__ = L;
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const REDISMODULE_ZADD_NOP = 1 << 4;
pub const REDISMODULE_HASH_NX = 1 << 0;
pub const _IO_USER_LOCK = 0x8000;
pub const INT16_MAX = 32767;
pub const REDISMODULE_REPLY_ERROR = 1;
pub const __SCHAR_MAX__ = 127;
pub const __UINT32_FMTx__ = "x";
pub const WINT_MIN = @as(c_uint, 0);
pub const __UINT8_FMTx__ = "hhx";
pub const __clockid_t_defined = 1;
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub inline fn __LDBL_REDIR_NTH(name: var, proto: var) @TypeOf(name ++ (proto ++ __THROW)) {
    return name ++ (proto ++ __THROW);
}
pub const __UINT_LEAST64_MAX__ = @as(c_ulong, 18446744073709551615);
pub const REDISMODULE_REPLY_NULL = 4;
pub const INT64_MIN = -__INT64_C(9223372036854775807) - 1;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __clang__ = 1;
pub const _BITS_STDINT_INTN_H = 1;
pub const __GLIBC__ = 2;
pub const __UINTPTR_FMTu__ = "lu";
pub const __USE_XOPEN2K8 = 1;
pub const REDISMODULE_ZADD_ADDED = 1 << 2;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __INT_FAST32_TYPE__ = c_int;
pub const UINTPTR_MAX = @as(c_ulong, 18446744073709551615);
pub const __UINT16_FMTx__ = "hx";
pub const __FLT_MIN_10_EXP__ = -37;
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __GNUC_VA_LIST = 1;
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZEOF_POINTER__ = 8;
pub const __SIZE_FMTX__ = "lX";
pub inline fn __feof_unlocked_body(_fp: var) @TypeOf(((_fp.*._flags) & _IO_EOF_SEEN) != 0) {
    return ((_fp.*._flags) & _IO_EOF_SEEN) != 0;
}
pub const __INT16_FMTd__ = "hd";
pub const __ATOMIC_RELEASE = 3;
pub const __UINT_FAST64_FMTX__ = "lX";
pub const WINT_MAX = @as(c_uint, 4294967295);
pub const INT_FAST16_MIN = -@as(c_long, 9223372036854775807) - 1;
pub const __USE_POSIX199309 = 1;
pub const INT32_MIN = -2147483647 - 1;
pub const __WINT_WIDTH__ = 32;
pub const __timer_t_defined = 1;
pub const SEEK_CUR = 1;
pub const __FLT_MAX_10_EXP__ = 38;
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __gnu_linux__ = 1;
pub const REDISMODULE_NO_EXPIRE = -1;
pub const _DEBUG = 1;
pub inline fn __PMT(args: var) @TypeOf(args) {
    return args;
}
pub inline fn htole64(x: var) @TypeOf(__uint64_identity(x)) {
    return __uint64_identity(x);
}
pub const __UINTPTR_WIDTH__ = 64;
pub const INTMAX_MIN = -__INT64_C(9223372036854775807) - 1;
pub const PTRDIFF_MIN = -@as(c_long, 9223372036854775807) - 1;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const INT64_MAX = __INT64_C(9223372036854775807);
pub const __GNUC_PATCHLEVEL__ = 1;
pub const _IO_ERR_SEEN = 0x0020;
pub const __INT64_FMTd__ = "ld";
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __GLIBC_USE_ISOC2X = 0;
pub const __UINT16_MAX__ = 65535;
pub const __ATOMIC_RELAXED = 0;
pub const _POSIX_SOURCE = 1;
pub const REDISMODULE_WRITE = 1 << 1;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __time_t_defined = 1;
pub const ____FILE_defined = 1;
pub const REDISMODULE_HASH_CFIELDS = 1 << 2;
pub const __GLIBC_USE_IEC_60559_BFP_EXT = 0;
pub const __INT_FAST16_TYPE__ = c_short;
pub inline fn be64toh(x: var) @TypeOf(__bswap_64(x)) {
    return __bswap_64(x);
}
pub const __UINT64_C_SUFFIX__ = UL;
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __CHAR_BIT__ = 8;
pub const __DBL_DECIMAL_DIG__ = 17;
pub inline fn __LDBL_REDIR(name: var, proto: var) @TypeOf(name ++ proto) {
    return name ++ proto;
}
pub inline fn __FDS_BITS(set: var) @TypeOf(set.*.__fds_bits) {
    return set.*.__fds_bits;
}
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const linux = 1;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const REDISMODULE_POSITIVE_INFINITE = 1.0 / 0.0;
pub const __LONG_DOUBLE_USES_FLOAT128 = 0;
pub const _BITS_STDIO_LIM_H = 1;
pub const __FLOAT128__ = 1;
pub const __attribute_deprecated__ = __attribute__(__deprecated__);
pub const REDISMODULE_REPLY_UNKNOWN = -1;
pub const __GLIBC_MINOR__ = 31;
pub const UINT_LEAST64_MAX = __UINT64_C(18446744073709551615);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __INTMAX_MAX__ = @as(c_long, 9223372036854775807);
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub inline fn FD_CLR(fd: var, fdsetp: var) @TypeOf(__FD_CLR(fd, fdsetp)) {
    return __FD_CLR(fd, fdsetp);
}
pub const __USE_MISC = 1;
pub const REDISMODULE_HASH_EXISTS = 1 << 3;
pub const __RDRND__ = 1;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __seg_fs = __attribute__(address_space(257));
pub const __XSAVEOPT__ = 1;
pub const REDISMODULE_OK = 0;
pub const __attribute_malloc__ = __attribute__(__malloc__);
pub const __HAVE_GENERIC_SELECTION = 1;
pub const __UINTMAX_FMTX__ = "lX";
pub const __AVX2__ = 1;
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const _STDC_PREDEF_H = 1;
pub const INTPTR_MIN = -@as(c_long, 9223372036854775807) - 1;
pub const UINT64_MAX = __UINT64_C(18446744073709551615);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __OPTIMIZE__ = 1;
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __SSE2_MATH__ = 1;
pub const __SIZEOF_PTHREAD_COND_T = 48;
pub const __SGX__ = 1;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __POPCNT__ = 1;
pub inline fn __LDBL_REDIR1(name: var, proto: var, alias: var) @TypeOf(name ++ proto) {
    return name ++ proto;
}
pub const __POINTER_WIDTH__ = 64;
pub const __ATOMIC_ACQ_REL = 4;
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __OFF_T_MATCHES_OFF64_T = 1;
pub const __STDC_HOSTED__ = 1;
pub const __PIC__ = 2;
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 0;
pub const __FXSR__ = 1;
pub inline fn le32toh(x: var) @TypeOf(__uint32_identity(x)) {
    return __uint32_identity(x);
}
pub const _BITS_WCHAR_H = 1;
pub const UINT_FAST16_MAX = @as(c_ulong, 18446744073709551615);
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __SIZE_WIDTH__ = 64;
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __UINTMAX_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const REDISMODULE_REPLY_STRING = 0;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __DBL_MANT_DIG__ = 53;
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT32_FMTX__ = "X";
pub const __SHRT_MAX__ = 32767;
pub const __ATOMIC_CONSUME = 1;
pub const __have_pthread_attr_t = 1;
pub const __GLIBC_USE_DEPRECATED_GETS = 0;
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INT8_MAX__ = 127;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __UINT8_FMTo__ = "hho";
pub const __struct_FILE_defined = 1;
pub const _BITS_ENDIANNESS_H = 1;
pub const __FLT_HAS_DENORM__ = 1;
pub const __UINT32_FMTo__ = "o";
pub const _BITS_UINTN_IDENTITY_H = 1;
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __GXX_ABI_VERSION = 1002;
pub const INTMAX_MAX = __INT64_C(9223372036854775807);
pub const _ENDIAN_H = 1;
pub const INT_LEAST16_MIN = -32767 - 1;
pub inline fn __ASMNAME(cname: var) @TypeOf(__ASMNAME2(__USER_LABEL_PREFIX__, cname)) {
    return __ASMNAME2(__USER_LABEL_PREFIX__, cname);
}
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const __INT8_FMTi__ = "hhi";
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub inline fn __attribute_format_arg__(x: var) @TypeOf(__attribute__(__format_arg__(x))) {
    return __attribute__(__format_arg__(x));
}
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const __USE_ISOC95 = 1;
pub const __clang_major__ = 10;
pub const REDISMODULE_READ = 1 << 0;
pub const __INT16_MAX__ = 32767;
pub const __linux = 1;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __UINT16_FMTo__ = "ho";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const REDISMODULE_LIST_TAIL = 1;
pub const INTPTR_MAX = @as(c_long, 9223372036854775807);
pub const __XSAVES__ = 1;
pub const __UINT_LEAST8_MAX__ = 255;
pub const UINT16_MAX = 65535;
pub const REDISMODULE_ERR = 1;
pub const INT_FAST64_MIN = -__INT64_C(9223372036854775807) - 1;
pub const __WORDSIZE = 64;
pub const __USE_POSIX = 1;
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __unix = 1;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub inline fn htobe16(x: var) @TypeOf(__bswap_16(x)) {
    return __bswap_16(x);
}
pub const __llvm__ = 1;
pub const __SLONG32_TYPE = c_int;
pub const __DBL_MAX_EXP__ = 1024;
pub const __LITTLE_ENDIAN = 1234;
pub const __GCC_ASM_FLAG_OUTPUTS__ = 1;
pub const __PTRDIFF_MAX__ = @as(c_long, 9223372036854775807);
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __linux__ = 1;
pub const __attribute_noinline__ = __attribute__(__noinline__);
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USE_ISOC99 = 1;
pub const __LDBL_MAX_EXP__ = 16384;
pub const __UINT_FAST32_MAX__ = @as(c_uint, 4294967295);
pub inline fn __FD_ELT(d: var) @TypeOf(d / __NFDBITS) {
    return d / __NFDBITS;
}
pub const __WINT_MAX__ = @as(c_uint, 4294967295);
pub const REDISMODULE_KEYTYPE_EMPTY = 0;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const REDISMODULE_APIVER_1 = 1;
pub const __INTPTR_WIDTH__ = 64;
pub const __XSAVE__ = 1;
pub const __BIG_ENDIAN = 4321;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __RDSEED__ = 1;
pub const PTRDIFF_MAX = @as(c_long, 9223372036854775807);
pub inline fn UINT16_C(c: var) @TypeOf(c) {
    return c;
}
pub const __FILE_defined = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __corei7__ = 1;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const _BITS_STDINT_UINTN_H = 1;
pub const INT_LEAST32_MIN = -2147483647 - 1;
pub const __XSAVEC__ = 1;
pub const INT8_MIN = -128;
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub inline fn be16toh(x: var) @TypeOf(__bswap_16(x)) {
    return __bswap_16(x);
}
pub const __LDBL_MANT_DIG__ = 64;
pub const UINT_LEAST32_MAX = @as(c_uint, 4294967295);
pub const __UINT_FAST8_MAX__ = 255;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __STDC_VERSION__ = @as(c_long, 201112);
pub const __BMI2__ = 1;
pub const __F16C__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __SIZEOF_INT__ = 4;
pub const NULL = @intToPtr(?*c_void, 0);
pub const __TIMESIZE = __WORDSIZE;
pub const _BITS_STDIO_H = 1;
pub inline fn va_end(ap: var) @TypeOf(__builtin_va_end(ap)) {
    return __builtin_va_end(ap);
}
pub const __UINT32_C_SUFFIX__ = U;
pub const __clock_t_defined = 1;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __INT_LEAST8_MAX__ = 127;
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = 0;
pub inline fn INT8_C(c: var) @TypeOf(c) {
    return c;
}
pub const __UINTMAX_FMTo__ = "lo";
pub const _SYS_TYPES_H = 1;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_FILE = struct__IO_FILE;
pub const __va_list_tag = struct___va_list_tag;
