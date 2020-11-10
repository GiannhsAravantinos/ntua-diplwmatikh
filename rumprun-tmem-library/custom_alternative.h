/*Taken from arch/x86/include/asm/alternative.h*/

#ifndef _CUSTOM_ALTERNATIVE_H
#define _CUSTOM_ALTERNATIVE_H


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


#endif
