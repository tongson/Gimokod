/*
 * The following notice applies to this header file (only):
 *
 * Copyright (c) 2002,2010 Solar Designer <solar at openwall.com>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted.
 */

#ifndef _CRYPT_FREESEC_H
#define _CRYPT_FREESEC_H

struct _crypt_extended_data {
	int initialized;
	u_int32_t saltbits;
	u_int32_t old_salt;
	u_int32_t en_keysl[16], en_keysr[16];
	u_int32_t de_keysl[16], de_keysr[16];
	u_int32_t old_rawkey0, old_rawkey1;
	char output[21];
};

/*
 * _crypt_extended_init() must be called explicitly before first use of
 * _crypt_extended_r().  Strictly speaking, _crypt_extended_init() is not
 * reentrant.  All it does is initialize some global variables to constant
 * values, so it is unlikely that anything would go wrong if this is done
 * multiple times in parallel, but correct behavior in that case is not
 * guaranteed (e.g., things may go wrong if a given CPU architecture can't
 * operate on 32-bit quantities natively, requiring read-modify-write
 * instruction sequences operating on larger quantities and thus affecting
 * nearby array elements).
 *
 * Before first use of the data structure, its "initialized" field must be
 * set to 0.  This is compatible with the requirement of some other crypt_r()
 * implementations requiring the entire data structure to be initialized
 * with all zero bytes, so that approach may be applied instead (e.g., this
 * may be required from the callers of a wrapper function).
 *
 * _crypt_extended_r() returns NULL on error.  Although modern standards say
 * that crypt(3) does in fact return NULL on error, many applications do not
 * expect that.  Thus, it is recommended that a crypt(3)-like wrapper function
 * translate these NULL returns into strings guaranteed to be different from
 * the "setting" string, too short for matching a valid password hash, and not
 * containing any characters that would be special for the passwd file format.
 * Specifically, such a wrapper function may return "*0" on error as long as
 * the "setting" string does not start with "*0", or "*1" otherwise.
 */

void _crypt_extended_init(void);

char *_crypt_extended_r(const char *key, const char *setting,
	struct _crypt_extended_data *data);

#endif
