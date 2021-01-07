#include "redismodule.h"

int HelloWorld_Command(RedisModuleCtx *ctx, RedisModuleString **argv, int argc) {
    RedisModule_ReplyWithSimpleString(ctx, "Hello World!");
    return REDISMODULE_OK;
}

int RedisModule_OnLoad(RedisModuleCtx *ctx, RedisModuleString **argv, int argc) {
    if (RedisModule_Init(ctx,"testmodule",1,REDISMODULE_APIVER_1)
        == REDISMODULE_ERR){
        return REDISMODULE_ERR;
    }

    if (RedisModule_CreateCommand(ctx,"test.hello", HelloWorld_Command,
        "readonly", 0, 0, 0) == REDISMODULE_ERR){
        return REDISMODULE_ERR;
    }

    return REDISMODULE_OK;
}
