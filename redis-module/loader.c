#include <fcntl.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>


#include "loader.h"
#include "chunk.h"
#include "tmem.h"
#include "tmem_ioctl.h"


int RedisModule_OnLoad(RedisModuleCtx *ctx, RedisModuleString **argv, int argc) {


    if (RedisModule_Init(ctx, "tmem", 1, REDISMODULE_APIVER_1) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "module.set", ModuleSet, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "module.get", ModuleGet, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    /* Base commands */

    if (RedisModule_CreateCommand(ctx, "tmem.get", TmemGet, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.put", TmemPut, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.inval", TmemInval, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.generate_size", TmemGenerateSize, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    /* Control commands */

    if (RedisModule_CreateCommand(ctx, "tmem.dummy", TmemDummy, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.real", TmemReal, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.sleepy", TmemSleepy, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.awake", TmemAwake, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.silent", TmemSilent, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.answer", TmemAnswer, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.generate", TmemGenerate, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.input", TmemInput, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    /* Get variants */

    if (RedisModule_CreateCommand(ctx, "tmem.get.redisgenerate", TmemRedisGenerate, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.get.redissilent", TmemRedisSilent, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.get.silentdirty", TmemSilentDirty, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    /* Put variants */

    if (RedisModule_CreateCommand(ctx, "tmem.put.echo", TmemEcho, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.put.drop", TmemDrop, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.put.poison", TmemPoison, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.put.poisonmalloc", TmemPoisonMalloc, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

      if (RedisModule_CreateCommand(ctx, "tmem.put.time", TmemPutTime, "write", 0, 0, 0) == REDISMODULE_ERR)/*declare custom command*/
          return REDISMODULE_ERR;

    /* File-based commands */
/*
    if (RedisModule_CreateCommand(ctx, "tmem.file.get", TmemFileGet, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.file.put", TmemFilePut, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;
*/
    /* Chunk commands */
 /*
    if (RedisModule_CreateCommand(ctx, "tmem.chunk.fill", ChunkFill, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.chunk.key", ChunkKey, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "tmem.chunk.inmemory", ChunkInMemory, "write", 0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;
*/
    fd = open(TMEM_PATH, O_RDWR);
    if (!fd)
        return REDISMODULE_ERR;

    return REDISMODULE_OK;
}
