/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : ttms

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-08-18 19:24:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for data_dict
-- ----------------------------
DROP TABLE IF EXISTS `data_dict`;
CREATE TABLE `data_dict` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_parent_id` int(11) DEFAULT NULL,
  `dict_index` int(11) DEFAULT NULL,
  `dict_name` varchar(200) DEFAULT NULL,
  `dict_value` varchar(100) NOT NULL,
  PRIMARY KEY (`dict_id`),
  KEY `FK_super_child_dict` (`dict_parent_id`),
  CONSTRAINT `FK_super_child_dict` FOREIGN KEY (`dict_parent_id`) REFERENCES `data_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='�����ֵ�(ӰƬ���͡�����ʱ��������)';

-- ----------------------------
-- Records of data_dict
-- ----------------------------
INSERT INTO `data_dict` VALUES ('1', null, '1', '�����ֵ�', '��');
INSERT INTO `data_dict` VALUES ('2', '1', '2', 'PLAYTYPE', 'ӰƬ����');
INSERT INTO `data_dict` VALUES ('3', '1', '3', 'PLAYLANG', 'ӰƬ����');
INSERT INTO `data_dict` VALUES ('4', '1', '4', '��ʧЧʱ��', '5');
INSERT INTO `data_dict` VALUES ('5', '2', '1', 'Costume Drama', '��װ��');
INSERT INTO `data_dict` VALUES ('6', '2', '2', 'Anime Piece', '����Ƭ');
INSERT INTO `data_dict` VALUES ('7', '2', '3', 'Life Drama', '�����');
INSERT INTO `data_dict` VALUES ('8', '2', '4', 'Horror Movies', '�ֲ�Ƭ');
INSERT INTO `data_dict` VALUES ('9', '2', '5', 'War Movies', 'ս��Ƭ');
INSERT INTO `data_dict` VALUES ('10', '2', '6', 'Science Fiction', '�ƻ�Ƭ');
INSERT INTO `data_dict` VALUES ('11', '3', '1', 'Chinese', '����');
INSERT INTO `data_dict` VALUES ('12', '3', '2', 'English', 'Ӣ��');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_tel_num` varchar(20) DEFAULT NULL,
  `emp_addr` varchar(200) DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_no` (`emp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Ա����';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '000001', '����', '13311111111', '������·563��', '111@163.com');
INSERT INTO `employee` VALUES ('2', '000002', '����', '13322222222', '����·22��', '222@21cn.com');
INSERT INTO `employee` VALUES ('3', '000003', '����', '13333333333', '����·33��', '333@yeah.net');
INSERT INTO `employee` VALUES ('4', '000004', '����', '13344444444', '��һ·44��', '444@sina.com.cn');
INSERT INTO `employee` VALUES ('5', '000005', '֣��', '13355555555', '������55��', '555@tom.com');
INSERT INTO `employee` VALUES ('6', '000006', '������', '13366666666', '��Ϫ��66��', '666@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('7', 'test01', 'С��', '13312345678', '������·563��', 'xiaozhao@163.com');
INSERT INTO `employee` VALUES ('8', 'test02', 'С��', '13312345678', '��·��23��', 'xiaowang@yeah.net');
INSERT INTO `employee` VALUES ('9', 'test03', 'С��', '15712345678', '�����123��', 'xiaotian@sina.com.cn');
INSERT INTO `employee` VALUES ('10', 'test04', 'С��', '17812345678', '�����65��', 'xiaohu@tom.com');
INSERT INTO `employee` VALUES ('11', 'test05', 'СǮ', '15612345678', '��б��·90��', 'xiaoqian@yahoo.com.cn');
INSERT INTO `employee` VALUES ('12', 'guest01', '����', '13312345678', '������·001��', 'laozhao@163.com');
INSERT INTO `employee` VALUES ('13', 'guest02', '����', '13312345678', '��·��002��', 'laowang@yeah.net');
INSERT INTO `employee` VALUES ('14', 'guest03', '����', '15712345678', '�����003��', 'laotian@sina.com.cn');
INSERT INTO `employee` VALUES ('15', 'guest04', '�Ϻ�', '17812345678', '�����004��', 'laohu@tom.com');
INSERT INTO `employee` VALUES ('16', 'guest05', '��Ǯ', '15612345678', '��б��·005��', 'laoqian@yahoo.com.cn');
INSERT INTO `employee` VALUES ('17', 'guest06', '����', '18710905922', '��������121��', 'laozhang@sohu.com');
INSERT INTO `employee` VALUES ('18', 'guest07', '����', '17812345678', '����·201��', 'laozhou@21cn.com');
INSERT INTO `employee` VALUES ('19', 'guest08', '����', '18912345678', '������30��', 'laoliu@126.com.cn');
INSERT INTO `employee` VALUES ('20', '000007', '������', '13377777777', '������·77��', 'zxy@163.com');

-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play` (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `play_type_id` int(11) DEFAULT NULL,
  `play_lang_id` int(11) DEFAULT NULL,
  `play_name` varchar(200) DEFAULT NULL,
  `play_introduction` varchar(2000) DEFAULT NULL,
  `play_image` varchar(1000) DEFAULT NULL,
  `play_length` int(11) DEFAULT NULL,
  `play_ticket_price` decimal(10,2) DEFAULT NULL,
  `play_status` smallint(6) DEFAULT NULL COMMENT 'ȡֵ���壺\r\n            0���������ݳ�\r\n            1���Ѱ����ݳ�\r\n            -1������',
  PRIMARY KEY (`play_id`),
  KEY `FK_dict_lan_play` (`play_lang_id`),
  KEY `FK_dict_type_play` (`play_type_id`),
  CONSTRAINT `FK_dict_lan_play` FOREIGN KEY (`play_lang_id`) REFERENCES `data_dict` (`dict_id`),
  CONSTRAINT `FK_dict_type_play` FOREIGN KEY (`play_type_id`) REFERENCES `data_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ӰƬ��Ϣ��';

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES ('1', '9', '11', 'ս��2', '��������������汾������Ѱ��С���������ޣ�����ȴͻȻ������һ�����޹��ҵ����ҡ���Ϊ����֮�����������Ĺ�ϵ���й������޷��ڷ���ʵ����װ�ж����뻪�ȡ�����Ϊ�����ϱ�������޷���������Ϊ���˵�ʹ�����������԰�ȫ���������Ȼ��Ȼ�ػص���������������һ�˴���������ɱ�е�ͬ��������չ���������������Ŷ����ĳ��������ڵ������𽥸��գ����մ���ս������Ϊͬ����ս����', null, '120', '35.00', '0');
INSERT INTO `play` VALUES ('2', '8', '11', '��������', '�������ŵ������»� �Σ���һ���ж��������ڳԺڣ�ʧ�ֱ�������������󣬳������ŵ�����ϴС������v�� �Σ�����������Ҷ�죨��� �Σ����֣���׷���Լ�����ķ�����̽Ƥ�������á���ŵ �Σ���Ƥ���µ��Ե��֡�С������֮���ŵ��ҵ��������ң����Լ���ͬ���ӵķ�����֯ͷĿ��գ���־ΰ �Σ��������ط�֮���ŵ��ӵ��µ��������ͬʱ��Ϊ���ŵ�һ����׽�ù鰸��Ƥ����˵�����ŵ������޵�ǰŮ��Amber���ž��� �Σ�����׷���ж�������ɵ������񣬿�Խŷ�޴�½��è����Ϸ���������ݡ����ζ̱���Ӻ��ŵ��������𽥱�Ƥ�������ա�������һ���˽ӽ��ռ�Ŀ�꣬�ŵ�����ʵ�ƻ�Ҳ�𽥸���ˮ��', null, '108', '30.00', '0');
INSERT INTO `play` VALUES ('3', '9', '12', '�ؿ̶���', '1940��5��25����6��4��֮�䣬�ڵ¹���е�����ӵĿ��ٹ����±�����Ӣ����������λ�ڷ�������������������ʱ�߾��ĸۿ�С�Ƕؿ̶��ˣ�����Ӣ�������������Է���֯�ġ��޵н��ӡ���������ʷ������ģ�ľ�����ɢ�ж����ɹ�����˳���33��8000������Ӣ��������������ʱ���˵�������', null, '125', '33.00', '0');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `sale_time` datetime DEFAULT NULL,
  `sale_payment` decimal(10,2) DEFAULT NULL,
  `sale_change` decimal(10,2) DEFAULT NULL,
  `sale_type` smallint(6) DEFAULT NULL COMMENT '���ȡֵ���壺\r\n            1�����۵�\r\n            -1���˿',
  `sale_status` smallint(6) DEFAULT NULL COMMENT '���۵�״̬���£�\r\n            0��������\r\n            1���Ѹ���',
  PRIMARY KEY (`sale_ID`),
  KEY `FK_employee_sale` (`emp_id`),
  CONSTRAINT `FK_employee_sale` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='���۱�';

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('1', '1', '2017-08-10 11:14:43', '35.00', '0.00', '1', '1');
INSERT INTO `sale` VALUES ('2', '2', '2017-08-11 11:19:19', '35.00', '0.00', '1', '1');
INSERT INTO `sale` VALUES ('3', '3', '2017-08-11 11:28:37', '30.00', '0.00', '1', '1');
INSERT INTO `sale` VALUES ('4', '1', '2017-08-11 12:07:46', '35.00', '0.00', '1', '1');

-- ----------------------------
-- Table structure for sale_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_item`;
CREATE TABLE `sale_item` (
  `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) DEFAULT NULL,
  `sale_ID` bigint(20) DEFAULT NULL,
  `sale_item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sale_item_id`),
  KEY `FK_sale_sale_item` (`sale_ID`),
  KEY `FK_ticket_sale_item` (`ticket_id`),
  CONSTRAINT `FK_sale_sale_item` FOREIGN KEY (`sale_ID`) REFERENCES `sale` (`sale_ID`),
  CONSTRAINT `FK_ticket_sale_item` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='������ϸ��';

-- ----------------------------
-- Records of sale_item
-- ----------------------------
INSERT INTO `sale_item` VALUES ('1', '1', '1', '35.00');
INSERT INTO `sale_item` VALUES ('2', '1', '2', '35.00');
INSERT INTO `sale_item` VALUES ('3', '3', '3', '30.00');
INSERT INTO `sale_item` VALUES ('4', '4', '4', '35.00');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `play_id` int(11) DEFAULT NULL,
  `sched_time` datetime NOT NULL,
  `sched_ticket_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sched_id`),
  KEY `FK_play_sched` (`play_id`),
  KEY `FK_studio_sched` (`studio_id`),
  CONSTRAINT `FK_play_sched` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `FK_studio_sched` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='��Ƭ��';

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1', '1', '1', '2017-08-11 08:00:00', '35.00');
INSERT INTO `schedule` VALUES ('2', '1', '1', '2017-08-11 10:30:00', '30.00');
INSERT INTO `schedule` VALUES ('3', '1', '2', '2017-08-11 15:00:00', '33.00');
INSERT INTO `schedule` VALUES ('4', '2', '3', '2017-08-11 08:00:00', '25.00');
INSERT INTO `schedule` VALUES ('5', '2', '2', '2017-08-11 10:30:00', '30.00');

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_column` int(11) DEFAULT NULL,
  `seat_status` smallint(6) NOT NULL DEFAULT '1' COMMENT 'ȡֵ���壺\r\n                       0���˴��ǿ�λ��û�а�������\r\n                       1����õ���λ������ʹ��\r\n                       -1����λ�𻵣����ܰ�����λ',
  PRIMARY KEY (`seat_id`),
  KEY `FK_studio_seat` (`studio_id`),
  CONSTRAINT `FK_studio_seat` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='��λ��';

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `seat` VALUES ('2', '1', '1', '2', '1');
INSERT INTO `seat` VALUES ('3', '1', '1', '3', '1');
INSERT INTO `seat` VALUES ('4', '1', '2', '1', '1');
INSERT INTO `seat` VALUES ('5', '1', '2', '2', '1');
INSERT INTO `seat` VALUES ('6', '1', '2', '3', '1');
INSERT INTO `seat` VALUES ('7', '1', '3', '1', '1');
INSERT INTO `seat` VALUES ('8', '1', '3', '2', '1');
INSERT INTO `seat` VALUES ('9', '1', '3', '3', '1');
INSERT INTO `seat` VALUES ('10', '2', '1', '1', '1');
INSERT INTO `seat` VALUES ('11', '2', '1', '2', '1');
INSERT INTO `seat` VALUES ('12', '2', '1', '3', '1');
INSERT INTO `seat` VALUES ('13', '2', '1', '4', '1');
INSERT INTO `seat` VALUES ('14', '2', '1', '5', '1');
INSERT INTO `seat` VALUES ('15', '2', '2', '1', '1');
INSERT INTO `seat` VALUES ('16', '2', '2', '2', '1');
INSERT INTO `seat` VALUES ('17', '2', '2', '3', '1');
INSERT INTO `seat` VALUES ('18', '2', '2', '4', '1');
INSERT INTO `seat` VALUES ('19', '2', '2', '5', '1');
INSERT INTO `seat` VALUES ('20', '2', '3', '1', '1');
INSERT INTO `seat` VALUES ('21', '2', '3', '2', '1');
INSERT INTO `seat` VALUES ('22', '2', '3', '3', '1');
INSERT INTO `seat` VALUES ('23', '2', '3', '4', '1');
INSERT INTO `seat` VALUES ('24', '2', '3', '5', '1');
INSERT INTO `seat` VALUES ('25', '2', '4', '1', '1');
INSERT INTO `seat` VALUES ('26', '2', '4', '2', '1');
INSERT INTO `seat` VALUES ('27', '2', '4', '3', '1');
INSERT INTO `seat` VALUES ('28', '2', '4', '4', '1');
INSERT INTO `seat` VALUES ('29', '2', '4', '5', '1');
INSERT INTO `seat` VALUES ('30', '2', '5', '1', '1');
INSERT INTO `seat` VALUES ('31', '2', '5', '2', '1');
INSERT INTO `seat` VALUES ('32', '2', '5', '3', '1');
INSERT INTO `seat` VALUES ('33', '2', '5', '4', '1');
INSERT INTO `seat` VALUES ('34', '2', '5', '5', '1');

-- ----------------------------
-- Table structure for studio
-- ----------------------------
DROP TABLE IF EXISTS `studio`;
CREATE TABLE `studio` (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) NOT NULL,
  `studio_row_count` int(11) DEFAULT NULL,
  `studio_col_count` int(11) DEFAULT NULL,
  `studio_introduction` varchar(2000) DEFAULT NULL,
  `studio_flag` smallint(6) DEFAULT NULL COMMENT 'ȡֵ���壺\r\n                        0����δ������λ�����Ը���������Ϣ������λ\r\n                        1���Ѿ�����Ӱ������λ��Ϣ��������λ�������ٰ�����λ��\r\n                        -1��Ӱ���𻵻��߷���������ʹ��',
  PRIMARY KEY (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Ӱ����';

-- ----------------------------
-- Records of studio
-- ----------------------------
INSERT INTO `studio` VALUES ('1', '1����', '3', '3', 'С��', '1');
INSERT INTO `studio` VALUES ('2', '2����', '5', '5', '������', '1');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `sched_id` int(11) DEFAULT NULL,
  `ticket_price` decimal(10,2) DEFAULT NULL,
  `ticket_status` smallint(6) DEFAULT NULL COMMENT '�������£�\r\n            0��������\r\n            1������\r\n            9������',
  `ticket_locked_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FK_sched_ticket` (`sched_id`),
  KEY `FK_seat_ticket` (`seat_id`),
  CONSTRAINT `FK_sched_ticket` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  CONSTRAINT `FK_seat_ticket` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='��ӰƱ��';

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('1', '1', '1', '35.00', '9', null);
INSERT INTO `ticket` VALUES ('2', '2', '1', '35.00', '9', null);
INSERT INTO `ticket` VALUES ('3', '10', '4', '30.00', '9', null);
INSERT INTO `ticket` VALUES ('4', '5', '3', '35.00', '9', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `emp_no` varchar(20) NOT NULL COMMENT '�û���',
  `emp_pass` varchar(20) NOT NULL DEFAULT '123456' COMMENT '����',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�û����ͣ�0Ϊ��ͨ�û���1�ǹ���Ա',
  `head_path` varchar(500) DEFAULT NULL COMMENT 'ͷ��·��',
  PRIMARY KEY (`emp_no`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��½��Ϣ��';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('000001', '123456', '1', '');
INSERT INTO `user` VALUES ('000002', '123456', '0', '');
INSERT INTO `user` VALUES ('000003', '123456', '0', '');
INSERT INTO `user` VALUES ('000004', '123456', '0', '');
INSERT INTO `user` VALUES ('000005', '123456', '0', '');
INSERT INTO `user` VALUES ('000006', '123456', '0', '');
INSERT INTO `user` VALUES ('000007', '123456', '0', '');
INSERT INTO `user` VALUES ('test01', '123456', '0', '');
