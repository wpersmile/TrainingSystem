CREATE SCHEMA `train_system` ;

CREATE TABLE `train_system`.`user` (
  `id` int not null auto_increment,
  `phone` VARCHAR(11) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT '新用户',
  `sex` VARCHAR(1) NULL DEFAULT 'N',
  `type` int default 1,
  `introduce` VARCHAR(255) NULL,
  `regtime` TIMESTAMP(0) NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
COMMENT = '这是用户数据表';


CREATE TABLE `train_system`.`file`(
`id` int not null auto_increment,
`name` varchar(255) not null,
`url` varchar(255) not null,
`type` varchar(10) not null,
`addtime` timestamp(0) NOT NULL default CURRENT_TIMESTAMP,
primary key(`id`)
)
COMMENT = '这是资源文件表';

use train_system;
CREATE TABLE `train_system`.`subject`(
`id` int not null auto_increment,
`name` varchar(255) not null,
`teacher` varchar(255) not null,
`type` varchar(10) not null,
`addtime` timestamp(0) not null default CURRENT_TIMESTAMP,
`info` varchar(1024) not null,
primary key(`id`)
)
COMMENT = '这是课程表';

CREATE TABLE `train_system`.`my_subject`(
`id` int not null auto_increment,
`user_phone` varchar(11) not null,
`sub_name` varchar(255) not null,
`addtime` timestamp(0) NOT NULL default CURRENT_TIMESTAMP,
primary key(`id`)
)
COMMENT = '这是用户课程表';

CREATE TAbLE `train_system`.`video`(
`id` int not null  auto_increment,
`vid` varchar(11) not null,
`name` varchar(255) not null,
`type` varchar(1024) not null,
primary key(`id`)
)
COMMENT = '这是视频表';

CREATE TAbLE `train_system`.`teacher`(
`id` int not null  auto_increment,
`name` varchar(255) not null,
`introduce` varchar(1024) null,
`pic` varchar(255) not null,
primary key(`id`)
)
COMMENT = '这是教师表';

INSERT INTO `train_system`.`user` (`phone`, `password`, `email`, `type`) VALUES ('admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin@qq.com', '0');

INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('g05240stcs6', '第一节：AVA开发环境-1', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('i0525fxj9hy', '第二节：JAVA开发环境-2-Eclipse IDE', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('n052530eep3', '第三节：JAVA变量-1-变量', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('e0525rvj3zr', '第四节：JAVA基础类型-1-整数类型', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('d05251a7mmp', '第五节：JAVA基础类型-2-其他类型及类型转换', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('a0525pf956t', '第六节：运算符和表达式-1-算数运算', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('l052502lf66', '第七节：运算符和表达式-2-关系运算、逻辑运算', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('x0525klfrqt', '第八节：运算符和表达式-3-赋值运算，字符串连接运算', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('t0525fuccn2', '第九节：运算符和表达式-4-三目运算', 'java');
INSERT INTO `train_system`.`video` (`vid`, `name`, `type`) VALUES ('o052593eouy', '第十节：运算符和表达式-5-收银柜台收款程序V1.0', 'java');



INSERT INTO `train_system`.`subject` (`name`, `teacher`, `type`, `info`) VALUES ('JAVA入门', '李东', '基础', 'JAVA入门教程，欢迎大家报名学习');
INSERT INTO `train_system`.`subject` (`name`, `teacher`, `type`, `info`) VALUES ('C++入门', '张东', '基础', 'C++入门教程，欢迎大家报名学习');
INSERT INTO `train_system`.`subject` (`name`, `teacher`, `type`, `info`) VALUES ('HTML入门', '马东', '基础', 'HTML入门教程，欢迎大家报名学习');
INSERT INTO `train_system`.`subject` (`name`, `teacher`, `type`, `info`) VALUES ('CSS入门', '黄东', '基础', 'CSS入门教程，欢迎大家报名学习');








