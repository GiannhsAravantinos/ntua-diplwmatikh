#ifndef _TMEM_KERNEL_H
#define _TMEM_KERNEL_H

#include <sys/types.h>
/*Every definition is taken as is from origia utmem driver implementation.
If those definitions are changes, then so should these ones here*/

/* KVM Hypercall commands */
#define PV_TMEM_GET_OP		0
#define PV_TMEM_PUT_OP		1
#define PV_TMEM_INVALIDATE_OP	2

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

/*Not actually used in tmem operations anymore*/
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



/*implementation of ALTERNATIVE MACRO*/

#define __stringify_1(x...) #x// Taken from include/linux/stringify.h
#define __stringify(x...) __stringify_1(x)

#define b_replacement(num)	"664"#num
#define e_replacement(num)	"665"#num

#define alt_end_marker		"663"
#define alt_slen		"662b-661b"
#define alt_pad_len		alt_end_marker"b-662b"
#define alt_total_slen		alt_end_marker"b-661b"
#define alt_rlen(num)		e_replacement(num)"f-"b_replacement(num)"f"

#define __OLDINSTR(oldinstr, num)\
        "661:\n\t" oldinstr "\n662:\n"\
        ".skip -(((" alt_rlen(num) ")-(" alt_slen ")) > 0) * "\
        "((" alt_rlen(num) ")-(" alt_slen ")),0x90\n"


#define OLDINSTR(oldinstr, num)\
        __OLDINSTR(oldinstr, num)\
        alt_end_marker ":\n"

#define ALTINSTR_ENTRY(feature, num)\
        " .long 661b - .\n"/* label */\
        " .long " b_replacement(num)"f - .\n"/* new instruction */\
        " .word " __stringify(feature) "\n"/* feature bit     */\
        " .byte " alt_total_slen "\n"/* source len      */\
        " .byte " alt_rlen(num) "\n"/* replacement len */\
        " .byte " alt_pad_len "\n"/* pad len */

#define ALTINSTR_REPLACEMENT(newinstr, feature, num)	/* replacement */\
        b_replacement(num)":\n\t" newinstr "\n" e_replacement(num) ":\n\t"

#define ALTERNATIVE(oldinstr, newinstr, feature)\
        OLDINSTR(oldinstr, 1)\
        ".pushsection .altinstructions,\"a\"\n"\
        ALTINSTR_ENTRY(feature, 1)\
        ".popsection\n"\
        ".pushsection .altinstr_replacement, \"ax\"\n"\
        ALTINSTR_REPLACEMENT(newinstr, feature, 1)\
        ".popsection"



/*definitons required for kvm_hypercall2() function*/

#define KVM_HC_TMEM   9 //Taken from include/uapi/linux/kvm_para.h !WARNING 9 MAYBE USED
#define X86_FEATURE_VMMCALL     (8*32+15) //Taken from arch/x86/include/asm/kvm_para.h

#define KVM_HYPERCALL \
        ALTERNATIVE(".byte 0x0f,0x01,0xc1", ".byte 0x0f,0x01,0xd9", X86_FEATURE_VMMCALL)

#endif
