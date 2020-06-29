//
// Created by Pedro Akos on 2019-10-11.
//

#ifndef YGGDFS_DISCOVERY_H
#define YGGDFS_DISCOVERY_H

#include "core/ygg_runtime.h"
#include "interfaces/discovery/discovery_events.h"
#include "core/data_structures/generic/list.h"

#define ACTIVATE_DISCOV 44
#define DEACTIVATE_DISCOV 45

typedef struct __discovery_args {
    unsigned int announce_period_s;
    unsigned int announce_period_ns;

    short proto_id;
}discovery_args;

proto_def* discovery_init(discovery_args* args);

#endif //YGGDFS_DISCOVERY_H
