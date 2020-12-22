#ifndef TMEM_H
#define TMEM_H

#include <sys/types.h>

/* TMEM operation numbers */
#define TMEM_GET 0
#define TMEM_PUT 1
#define TMEM_INVAL 2

/* TMEM structures */
#define TMEM_MAX (1024 * 1024)

struct tmem_put_request {
    void *key;
    size_t key_len;
    void *value;
    size_t value_len;
};

struct tmem_get_request {
    void *key;
    size_t key_len;
    void *value;
    size_t *value_lenp;
};

struct tmem_invalidate_request {
    void *key;
    size_t key_len;
};

struct tmem_answer{
	void *value;
	size_t *value_lenp;
};

struct tmem_request {
	union {
		struct tmem_put_request put;
		struct tmem_get_request get;
		struct tmem_invalidate_request inval;
	};
	unsigned long flags;
};

#endif
