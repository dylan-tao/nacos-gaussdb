/* SQLINES DEMO *** -2018 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * keyword: type,usage,role,action,password
 */
CREATE TABLE "NACOS_SERVER"."CONFIG_INFO"
(
"ID" BIGINT IDENTITY(1505866, 1) NOT NULL,
"DATA_ID" VARCHAR(255) NOT NULL,
"GROUP_ID" VARCHAR(255),
"CONTENT" CLOB NOT NULL,
"MD5" VARCHAR(32),
"GMT_CREATE" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"GMT_MODIFIED" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"SRC_USER" TEXT,
"SRC_IP" VARCHAR(50),
"APP_NAME" VARCHAR(128),
"TENANT_ID" VARCHAR(128) DEFAULT '',
"C_DESC" VARCHAR(256),
"C_USE" VARCHAR(64),
"EFFECT" VARCHAR(64),
"TYPE" VARCHAR(64),
"C_SCHEMA" TEXT,
"ENCRYPTED_DATA_KEY" TEXT NOT NULL,
NOT CLUSTER PRIMARY KEY("ID"),
CONSTRAINT "UK_CONFIGINFO_DATAGROUPTENANT" UNIQUE("DATA_ID", "GROUP_ID", "TENANT_ID")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."CONFIG_INFO" IS '配置信息表';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."CONTENT" IS 'content';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."DATA_ID" IS 'data_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."ENCRYPTED_DATA_KEY" IS '秘钥';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."GMT_CREATE" IS '创建时间';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."GMT_MODIFIED" IS '修改时间';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."ID" IS 'id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."MD5" IS 'md5';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."SRC_IP" IS 'source ip';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."SRC_USER" IS 'source user';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO"."TENANT_ID" IS '租户字段';


CREATE TABLE "NACOS_SERVER"."CONFIG_INFO_AGGR"
(
"ID" BIGINT IDENTITY(1, 1) NOT NULL,
"DATA_ID" VARCHAR(255) NOT NULL,
"GROUP_ID" VARCHAR(255) NOT NULL,
"DATUM_ID" VARCHAR(255) NOT NULL,
"CONTENT" CLOB NOT NULL,
"GMT_MODIFIED" TIMESTAMP(0) NOT NULL,
"APP_NAME" VARCHAR(128),
"TENANT_ID" VARCHAR(128) DEFAULT '',
NOT CLUSTER PRIMARY KEY("ID"),
CONSTRAINT "UK_CONFIGINFOAGGR_DATAGROUPTENANTDATUM" UNIQUE("DATA_ID", "GROUP_ID", "TENANT_ID", "DATUM_ID")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."CONFIG_INFO_AGGR" IS '配置信息审核表';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_AGGR"."CONTENT" IS '内容';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_AGGR"."DATA_ID" IS 'data_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_AGGR"."DATUM_ID" IS 'datum_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_AGGR"."GMT_MODIFIED" IS '修改时间';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_AGGR"."GROUP_ID" IS 'group_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_AGGR"."ID" IS 'id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_AGGR"."TENANT_ID" IS '租户字段';


CREATE TABLE "NACOS_SERVER"."CONFIG_INFO_BETA"
(
"ID" BIGINT IDENTITY(1, 1) NOT NULL,
"DATA_ID" VARCHAR(255) NOT NULL,
"GROUP_ID" VARCHAR(128) NOT NULL,
"APP_NAME" VARCHAR(128),
"CONTENT" CLOB NOT NULL,
"BETA_IPS" VARCHAR(1024),
"MD5" VARCHAR(32),
"GMT_CREATE" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"GMT_MODIFIED" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"SRC_USER" TEXT,
"SRC_IP" VARCHAR(50),
"TENANT_ID" VARCHAR(128) DEFAULT '',
"ENCRYPTED_DATA_KEY" TEXT NOT NULL,
NOT CLUSTER PRIMARY KEY("ID"),
CONSTRAINT "UK_CONFIGINFOBETA_DATAGROUPTENANT" UNIQUE("DATA_ID", "GROUP_ID", "TENANT_ID")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."CONFIG_INFO_BETA" IS '配置信息beta表';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."APP_NAME" IS 'app_name';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."BETA_IPS" IS 'betaIps';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."CONTENT" IS 'content';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."DATA_ID" IS 'data_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."ENCRYPTED_DATA_KEY" IS '秘钥';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."GMT_CREATE" IS '创建时间';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."GMT_MODIFIED" IS '修改时间';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."GROUP_ID" IS 'group_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."ID" IS 'id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."MD5" IS 'md5';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."SRC_IP" IS 'source ip';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."SRC_USER" IS 'source user';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_BETA"."TENANT_ID" IS '租户字段';


CREATE TABLE "NACOS_SERVER"."CONFIG_INFO_TAG"
(
"ID" BIGINT IDENTITY(1, 1) NOT NULL,
"DATA_ID" VARCHAR(255) NOT NULL,
"GROUP_ID" VARCHAR(128) NOT NULL,
"TENANT_ID" VARCHAR(128) DEFAULT '',
"TAG_ID" VARCHAR(128) NOT NULL,
"APP_NAME" VARCHAR(128),
"CONTENT" CLOB NOT NULL,
"MD5" VARCHAR(32),
"GMT_CREATE" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"GMT_MODIFIED" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"SRC_USER" TEXT,
"SRC_IP" VARCHAR(50),
NOT CLUSTER PRIMARY KEY("ID"),
CONSTRAINT "UK_CONFIGINFOTAG_DATAGROUPTENANTTAG" UNIQUE("DATA_ID", "GROUP_ID", "TENANT_ID", "TAG_ID")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."CONFIG_INFO_TAG" IS '配置信息标签表';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."APP_NAME" IS 'app_name';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."CONTENT" IS 'content';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."DATA_ID" IS 'data_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."GMT_CREATE" IS '创建时间';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."GMT_MODIFIED" IS '修改时间';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."GROUP_ID" IS 'group_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."ID" IS 'id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."MD5" IS 'md5';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."SRC_IP" IS 'source ip';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."SRC_USER" IS 'source user';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."TAG_ID" IS 'tag_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_INFO_TAG"."TENANT_ID" IS 'tenant_id';


CREATE TABLE "NACOS_SERVER"."CONFIG_TAGS_RELATION"
(
"ID" BIGINT NOT NULL,
"TAG_NAME" VARCHAR(128) NOT NULL,
"TAG_TYPE" VARCHAR(64),
"DATA_ID" VARCHAR(255) NOT NULL,
"GROUP_ID" VARCHAR(128) NOT NULL,
"TENANT_ID" VARCHAR(128) DEFAULT '',
"NID" BIGINT IDENTITY(1, 1) NOT NULL,
NOT CLUSTER PRIMARY KEY("NID"),
CONSTRAINT "UK_CONFIGTAGRELATION_CONFIGIDTAG" UNIQUE("ID", "TAG_NAME", "TAG_TYPE")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."CONFIG_TAGS_RELATION" IS '配置信息标签关系表';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_TAGS_RELATION"."DATA_ID" IS 'data_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_TAGS_RELATION"."GROUP_ID" IS 'group_id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_TAGS_RELATION"."ID" IS 'id';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_TAGS_RELATION"."TAG_NAME" IS 'tag_name';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_TAGS_RELATION"."TAG_TYPE" IS 'tag_type';
COMMENT ON COLUMN "NACOS_SERVER"."CONFIG_TAGS_RELATION"."TENANT_ID" IS 'tenant_id';


CREATE OR REPLACE  INDEX "IDX_TENANT_ID" ON "NACOS_SERVER"."CONFIG_TAGS_RELATION"("TENANT_ID" ASC) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

CREATE TABLE "NACOS_SERVER"."GROUP_CAPACITY"
(
"ID" BIGINT IDENTITY(1, 1) NOT NULL,
"GROUP_ID" VARCHAR(128) DEFAULT '' NOT NULL,
"QUOTA" BIGINT DEFAULT 0 NOT NULL,
"USAGE" BIGINT DEFAULT 0 NOT NULL,
"MAX_SIZE" BIGINT DEFAULT 0 NOT NULL,
"MAX_AGGR_COUNT" BIGINT DEFAULT 0 NOT NULL,
"MAX_AGGR_SIZE" BIGINT DEFAULT 0 NOT NULL,
"MAX_HISTORY_COUNT" BIGINT DEFAULT 0 NOT NULL,
"GMT_CREATE" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"GMT_MODIFIED" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY("ID"),
CONSTRAINT "UK_GROUP_ID" UNIQUE("GROUP_ID"),
CHECK("QUOTA" >= 0)
,CHECK("USAGE" >= 0)
,CHECK("MAX_SIZE" >= 0)
,CHECK("MAX_AGGR_COUNT" >= 0)
,CHECK("MAX_AGGR_SIZE" >= 0)
,CHECK("MAX_HISTORY_COUNT" >= 0)) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."GROUP_CAPACITY" IS '集群、各Group容量信息表';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."GMT_CREATE" IS '创建时间';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."GMT_MODIFIED" IS '修改时间';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."GROUP_ID" IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."ID" IS '主键ID';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."MAX_AGGR_COUNT" IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."MAX_AGGR_SIZE" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."MAX_HISTORY_COUNT" IS '最大变更历史数量';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."MAX_SIZE" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."QUOTA" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "NACOS_SERVER"."GROUP_CAPACITY"."USAGE" IS '使用量';


CREATE TABLE "NACOS_SERVER"."HIS_CONFIG_INFO"
(
"ID" DECIMAL(20,0) NOT NULL,
"NID" BIGINT IDENTITY(1631392, 1) NOT NULL,
"DATA_ID" VARCHAR(255) NOT NULL,
"GROUP_ID" VARCHAR(128) NOT NULL,
"APP_NAME" VARCHAR(128),
"CONTENT" CLOB NOT NULL,
"MD5" VARCHAR(32),
"GMT_CREATE" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"GMT_MODIFIED" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"SRC_USER" TEXT,
"SRC_IP" VARCHAR(50),
"OP_TYPE" CHAR(10),
"TENANT_ID" VARCHAR(128) DEFAULT '',
"ENCRYPTED_DATA_KEY" TEXT NOT NULL,
NOT CLUSTER PRIMARY KEY("NID"),
CHECK("ID" >= 0)) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."HIS_CONFIG_INFO" IS '配置信息历史表';
COMMENT ON COLUMN "NACOS_SERVER"."HIS_CONFIG_INFO"."APP_NAME" IS 'app_name';
COMMENT ON COLUMN "NACOS_SERVER"."HIS_CONFIG_INFO"."ENCRYPTED_DATA_KEY" IS '秘钥';
COMMENT ON COLUMN "NACOS_SERVER"."HIS_CONFIG_INFO"."TENANT_ID" IS '租户字段';


CREATE OR REPLACE  INDEX "IDX_GMT_CREATE" ON "NACOS_SERVER"."HIS_CONFIG_INFO"("GMT_CREATE" ASC) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "IDX_DID" ON "NACOS_SERVER"."HIS_CONFIG_INFO"("DATA_ID" ASC) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "IDX_GMT_MODIFIED" ON "NACOS_SERVER"."HIS_CONFIG_INFO"("GMT_MODIFIED" ASC) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

CREATE TABLE "NACOS_SERVER"."PERMISSIONS"
(
"ROLE" VARCHAR(50) NOT NULL,
"RESOURCES" VARCHAR(255) NOT NULL,
"ACTION" VARCHAR(8) NOT NULL,
CONSTRAINT "UK_ROLE_PERMISSION" UNIQUE("ROLE", "RESOURCES", "ACTION")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."PERMISSIONS" IS '权限表';


CREATE TABLE "NACOS_SERVER"."ROLES"
(
"USERNAME" VARCHAR(50) NOT NULL,
"ROLE" VARCHAR(50) NOT NULL,
CONSTRAINT "IDX_USER_ROLE" UNIQUE("USERNAME", "ROLE")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."ROLES" IS '角色表';


CREATE TABLE "NACOS_SERVER"."TENANT_CAPACITY"
(
"ID" BIGINT IDENTITY(1, 1) NOT NULL,
"TENANT_ID" VARCHAR(128) DEFAULT '' NOT NULL,
"QUOTA" BIGINT DEFAULT 0 NOT NULL,
"USAGE" BIGINT DEFAULT 0 NOT NULL,
"MAX_SIZE" BIGINT DEFAULT 0 NOT NULL,
"MAX_AGGR_COUNT" BIGINT DEFAULT 0 NOT NULL,
"MAX_AGGR_SIZE" BIGINT DEFAULT 0 NOT NULL,
"MAX_HISTORY_COUNT" BIGINT DEFAULT 0 NOT NULL,
"GMT_CREATE" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"GMT_MODIFIED" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY("ID"),
CONSTRAINT "UK_TENANT_ID" UNIQUE("TENANT_ID"),
CHECK("QUOTA" >= 0)
,CHECK("USAGE" >= 0)
,CHECK("MAX_SIZE" >= 0)
,CHECK("MAX_AGGR_COUNT" >= 0)
,CHECK("MAX_AGGR_SIZE" >= 0)
,CHECK("MAX_HISTORY_COUNT" >= 0)) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."TENANT_CAPACITY" IS '租户容量信息表';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."GMT_CREATE" IS '创建时间';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."GMT_MODIFIED" IS '修改时间';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."ID" IS '主键ID';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."MAX_AGGR_COUNT" IS '聚合子配置最大个数';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."MAX_AGGR_SIZE" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."MAX_HISTORY_COUNT" IS '最大变更历史数量';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."MAX_SIZE" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."QUOTA" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."TENANT_ID" IS 'Tenant ID';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_CAPACITY"."USAGE" IS '使用量';


CREATE TABLE "NACOS_SERVER"."TENANT_INFO"
(
"ID" BIGINT IDENTITY(25, 1) NOT NULL,
"KP" VARCHAR(128) NOT NULL,
"TENANT_ID" VARCHAR(128) DEFAULT '',
"TENANT_NAME" VARCHAR(128) DEFAULT '',
"TENANT_DESC" VARCHAR(256),
"CREATE_SOURCE" VARCHAR(32),
"GMT_CREATE" BIGINT NOT NULL,
"GMT_MODIFIED" BIGINT NOT NULL,
NOT CLUSTER PRIMARY KEY("ID"),
CONSTRAINT "UK_TENANT_INFO_KPTENANTID" UNIQUE("KP", "TENANT_ID")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."TENANT_INFO" IS '租户表';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."CREATE_SOURCE" IS 'create_source';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."GMT_CREATE" IS '创建时间';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."GMT_MODIFIED" IS '修改时间';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."ID" IS 'id';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."KP" IS 'kp';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."TENANT_DESC" IS 'tenant_desc';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."TENANT_ID" IS 'tenant_id';
COMMENT ON COLUMN "NACOS_SERVER"."TENANT_INFO"."TENANT_NAME" IS 'tenant_name';


CREATE OR REPLACE  INDEX "INDEX148612744063600" ON "NACOS_SERVER"."TENANT_INFO"("TENANT_ID" ASC) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

CREATE TABLE "NACOS_SERVER"."USERS"
(
"USERNAME" VARCHAR(50) NOT NULL,
"PASSWORD" VARCHAR(500) NOT NULL,
"ENABLED" TINYINT NOT NULL,
NOT CLUSTER PRIMARY KEY("USERNAME")) STORAGE(ON "NACOS_SERVER", CLUSTERBTR) ;

COMMENT ON TABLE "NACOS_SERVER"."USERS" IS '用户表';

INSERT INTO "NACOS_SERVER"."ROLES" ("USERNAME","ROLE") VALUES
	 ('nacos','ROLE_ADMIN');

INSERT INTO "NACOS_SERVER"."USERS" ("USERNAME","PASSWORD","ENABLED") VALUES
	 ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);