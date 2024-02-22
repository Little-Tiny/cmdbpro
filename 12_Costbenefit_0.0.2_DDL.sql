-- B2461_计费管理v1.50-成本利润管理（二期）_Costbenefit_DDL_成本.sql 孟庆虎 start
ALTER TABLE CL_ChannelCostTransConfig ADD SIGNFLAG NUMBER(1)  DEFAULT 0 NOT NULL;
COMMENT ON COLUMN CL_CHANNELCOSTTRANSCONFIG.SIGNFLAG IS '是否为签约 0=非签约 1=签约';

CREATE TABLE CL_ChCostSuppReportLog (
SystemNo    VARCHAR2(32)   NOT NULL,
SystemTime    CHAR(17)        NOT NULL,
ReportTimeType NUMBER(1)  NOT NULL,
StartTime       VARCHAR(14)  NOT NULL,
ReportStatus     NUMBER(2)   DEFAULT 10 NOT NULL ,
UpdateTime      CHAR(17),
UpdateUser       VARCHAR2(64)
);


ALTER TABLE CL_ChCostSuppReportLog ADD CONSTRAINT PK_CL_ChCostSuppReportLog PRIMARY KEY (SYSTEMNO);
CREATE UNIQUE INDEX U_CL_ChCostSuppReportLog1 ON CL_ChCostSuppReportLog(ReportTimeType,StartTime);

COMMENT ON TABLE CL_ChCostSuppReportLog IS '成本供应商报表生成日志';
COMMENT ON COLUMN CL_ChCostSuppReportLog.SYSTEMNO IS '系统流水号';
COMMENT ON COLUMN CL_ChCostSuppReportLog.SystemTime IS '系统时间，格式：yyyyMMddHHmmssSSS';
COMMENT ON COLUMN CL_ChCostSuppReportLog.ReportTimeType IS '报表时间类型
1-按半小时
2-按天
3-按月';
COMMENT ON COLUMN CL_ChCostSuppReportLog.StartTime IS '报表数据开始时间，格式：yyyyMMddHHmmss';
COMMENT ON COLUMN CL_ChCostSuppReportLog.ReportStatus IS '报表状态
10=生成中
20=生成成功
30=生成失败';
COMMENT ON COLUMN CL_ChCostSuppReportLog.UpdateTime IS '更新时间，格式：yyyyMMddHHmmssSSS';
COMMENT ON COLUMN CL_ChCostSuppReportLog.UpdateUser IS '更新人';


ALTER TABLE CL_ChannelCostLog ADD fileLines NUMBER(16)   DEFAULT 0 NOT NULL;
COMMENT ON COLUMN CL_ChannelCostLog.fileLines IS '文件行数';
-- B2461_计费管理v1.50-成本利润管理（二期）_Costbenefit_DDL_成本.sql 孟庆虎 end

