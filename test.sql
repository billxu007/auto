ALTER TABLE `运输方式` DROP FOREIGN KEY `fk_运输方式_购买.采购订单_1`;

DROP INDEX `index` ON `运输方式`;
DROP INDEX `index_hang` ON `运输方式`;

DROP TABLE `运输方式`;
DROP TABLE `购买.采购订单`;

CREATE TABLE `运输方式` (
`运输方式编号` int(10) NOT NULL,
`名` varchar(255) NULL,
`运输费用` decimal(19,2) NULL,
`运输汇率` decimal(19,2) NULL,
`行编号` char(36) NULL,
`修改日期` datetime NULL,
PRIMARY KEY (`运输方式编号`) ,
UNIQUE INDEX `index` (`名` ASC) USING BTREE,
INDEX `index_hang` (`行编号` ASC) USING BTREE
);
CREATE TABLE `购买.采购订单` (
`采购订单编号` int(10) NOT NULL,
`修改编号` tinyint NULL,
`状态` tinyint NULL,
`雇员编号` int NULL,
`供应商编号` int NULL,
`运输方式编号` int NULL,
PRIMARY KEY (`采购订单编号`) 
);

ALTER TABLE `运输方式` ADD CONSTRAINT `fk_运输方式_购买.采购订单_1` FOREIGN KEY (`运输方式编号`) REFERENCES `购买.采购订单` (`运输方式编号`);

