#include "redismodule.h"

int TmemGet(RedisModuleCtx *ctx, RedisModuleString **argv, int argc) {

    RedisModule_ReplyWithSimpleString(ctx, "That was a get req");

    return REDISMODULE_OK;
}



int RedisModule_OnLoad(RedisModuleCtx *ctx, RedisModuleString **argv, int argc) {
    if (RedisModule_Init(ctx,"tmem-rumprun",1,REDISMODULE_APIVER_1)
    == REDISMODULE_ERR){
         return REDISMODULE_ERR;
    }


    if (RedisModule_CreateCommand(ctx,"tmem-rumprun.tmemGet", TmemGet, "write", 0, 0, 0)
    == REDISMODULE_ERR){
        return REDISMODULE_ERR;
    }

    return REDISMODULE_OK;
}
