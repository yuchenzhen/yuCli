DROP TABLE IF EXISTS `orm_job`;
CREATE TABLE IF NOT EXISTS `orm_job` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `url` VARCHAR(32) NOT NULL COMMENT '请求地址',
  `params` VARCHAR(32) NOT NULL COMMENT '请求参数',
  `excute_time` VARCHAR(32) NOT NULL COMMENT '执行时间',
  `project_id` VARCHAR(32) NOT NULL UNIQUE COMMENT '所属项目 id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='orm_job 表';

CREATE TABLE IF NOT EXISTS `orm_jobResult` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='orm_jobResult 表';


CREATE TABLE IF NOT EXISTS `orm_project` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `userId` VARCHAR(32) NOT NULL COMMENT '项目所属人',
  `userGroup` VARCHAR(32) NOT NULL COMMENT '项目所属组',
  `name` VARCHAR(32) NOT NULL COMMENT '项目名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='orm_project 表';

CREATE TABLE IF NOT EXISTS `orm_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `name` VARCHAR(32) NOT NULL COMMENT '用户名',
  `userGroup` VARCHAR(32) NOT NULL COMMENT '用户组',
  `password` VARCHAR(32) NOT NULL COMMENT '加密后的密码',
  `salt` VARCHAR(32) NOT NULL COMMENT '加密使用的盐',
  `email` VARCHAR(32) NOT NULL COMMENT '邮箱',
  `phoneNumber` VARCHAR(32) NOT NULL COMMENT '手机号码',
  `status` VARCHAR(32) NOT NULL COMMENT '状态，-1：逻辑删除，0：禁用，1：启用',
  `createTime` VARCHAR(32) NOT NULL COMMENT '创建时间',
  `lastLoginTime` VARCHAR(32) NOT NULL COMMENT '上次登录时间',
  `lastUpdateTime` VARCHAR(32) NOT NULL COMMENT '上次更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='orm_user 表';


DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;

create table qrtz_job_details(
sched_name varchar(120) not null,
job_name varchar(80) not null,
job_group varchar(80) not null,
description varchar(120),
job_class_name varchar(128) not null,
is_durable integer not null,
is_nonconcurrent integer not null,
is_update_data integer not null,
requests_recovery integer not null,
job_data blob(2000),
primary key (sched_name,job_name,job_group)
);

create table qrtz_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
job_name varchar(80) not null,
job_group varchar(80) not null,
description varchar(120),
next_fire_time bigint,
prev_fire_time bigint,
priority integer,
trigger_state varchar(16) not null,
trigger_type varchar(8) not null,
start_time bigint not null,
end_time bigint,
calendar_name varchar(80),
misfire_instr smallint,
job_data blob(2000),
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,job_name,job_group) references qrtz_job_details(sched_name,job_name,job_group)
);

create table qrtz_simple_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
repeat_count bigint not null,
repeat_interval bigint not null,
times_triggered bigint not null,
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group) references qrtz_triggers(sched_name,trigger_name,trigger_group)
);

create table qrtz_cron_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
cron_expression varchar(120) not null,
time_zone_id varchar(80),
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group) references qrtz_triggers(sched_name,trigger_name,trigger_group)
);

CREATE TABLE qrtz_simprop_triggers
  (
    sched_name varchar(120) not null,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512),
    STR_PROP_2 VARCHAR(512),
    STR_PROP_3 VARCHAR(512),
    INT_PROP_1 INT,
    INT_PROP_2 INT,
    LONG_PROP_1 BIGINT,
    LONG_PROP_2 BIGINT,
    DEC_PROP_1 NUMERIC(13,4),
    DEC_PROP_2 NUMERIC(13,4),
    BOOL_PROP_1 VARCHAR(1),
    BOOL_PROP_2 VARCHAR(1),
    PRIMARY KEY (sched_name,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (sched_name,TRIGGER_NAME,TRIGGER_GROUP)
    REFERENCES QRTZ_TRIGGERS(sched_name,TRIGGER_NAME,TRIGGER_GROUP)
);

create table qrtz_blob_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
blob_data blob(2000),
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group) references qrtz_triggers(sched_name,trigger_name,trigger_group)
);

create table qrtz_calendars(
sched_name varchar(120) not null,
calendar_name varchar(80) not null,
calendar blob(2000) not null,
primary key (calendar_name)
);

create table qrtz_fired_triggers(
sched_name varchar(120) not null,
entry_id varchar(95) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
instance_name varchar(80) not null,
fired_time bigint not null,
sched_time bigint not null,
priority integer not null,
state varchar(16) not null,
job_name varchar(80),
job_group varchar(80),
is_nonconcurrent integer,
requests_recovery integer,
primary key (sched_name,entry_id)
);

create table qrtz_paused_trigger_grps(
sched_name varchar(120) not null,
trigger_group varchar(80) not null,
primary key (sched_name,trigger_group)
);

create table qrtz_scheduler_state(
sched_name varchar(120) not null,
instance_name varchar(80) not null,
last_checkin_time bigint not null,
checkin_interval bigint not null,
primary key (sched_name,instance_name)
);

create table qrtz_locks(
sched_name varchar(120) not null,
lock_name varchar(40) not null,
primary key (sched_name,lock_name)
);



