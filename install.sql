CREATE TABLE IF NOT EXISTS `pi_ratepay_settings` (
  `OXID` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` varchar(255) DEFAULT NULL,
  `SECURITY_CODE` varchar(255) DEFAULT NULL,
  `ACCOUNT_HOLDER` varchar(255) DEFAULT '',
  `BANK_NAME` varchar(255) DEFAULT '',
  `BANK_CODE_NUMBER` varchar(255) DEFAULT '',
  `ACCOUNT_NUMBER` varchar(255) DEFAULT '',
  `SWIFT_BIC` varchar(255) DEFAULT '',
  `IBAN` varchar(255) DEFAULT '',
  `debt_holder` varchar(255) DEFAULT '',
  `INVOICE_FIELD` text,
  `AGB_URL` varchar(255) DEFAULT '',
  `RATEPAY_URL` varchar(255) DEFAULT '',
  `POLICY_URL` varchar(255) DEFAULT '',
  `RIGHT_OF_REVOCATION_URL` varchar(255) DEFAULT '',
  `SANDBOX` tinyint(1) NOT NULL DEFAULT '1',
  `LOGGING` tinyint(1) NOT NULL DEFAULT '0',
  `TYPE` varchar(11) NOT NULL,
  `PAYMENT_FIRSTDAY` tinyint(1) NOT NULL DEFAULT '0',
  `DUEDATE` int(11) NOT NULL DEFAULT '14',
  `SAVEBANKDATA` tinyint(1) NOT NULL DEFAULT '0',
  `ACTIVATE_ELV` tinyint(1) NOT NULL default '0',
  `WHITELABEL` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `B2B` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `DELIVERY_ADDRESS` TINYINT( 1 ) NOT NULL DEFAULT '0',  
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `pi_ratepay_orders` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` varchar(32) character set latin1 collate latin1_general_ci NOT NULL,
  `TRANSACTION_ID` varchar(64) NOT NULL,
  `TRANSACTION_SHORT_ID` varchar(20) NOT NULL,
  `DESCRIPTOR` varchar(20) NOT NULL,
  `USERBIRTHDATE` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `pi_ratepay_order_details` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ARTICLE_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ORDERED` INT NOT NULL DEFAULT '1',
  `SHIPPED` INT NOT NULL DEFAULT '0',
  `CANCELLED` INT NOT NULL DEFAULT '0',
  `RETURNED` INT NOT NULL DEFAULT '0',
   PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pi_ratepay_logs` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` varchar(255) CHARACTER SET utf8 NOT NULL,
  `TRANSACTION_ID` varchar(255) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_METHOD` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_TYPE` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_SUBTYPE` varchar(40) CHARACTER SET utf8 NOT NULL,
  `RESULT` varchar(40) CHARACTER SET utf8 NOT NULL,
  `REQUEST` mediumtext CHARACTER SET utf8 NOT NULL,
  `RESPONSE` mediumtext CHARACTER SET utf8 NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RESULT_CODE` varchar(5) CHARACTER SET utf8 NOT NULL,
  `FIRST_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `LAST_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `REASON` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `pi_ratepay_history` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ARTICLE_NUMBER` VARCHAR (255) NOT NULL,
  `QUANTITY` INT NOT NULL,
  `METHOD` VARCHAR( 40 ) NOT NULL,
  `SUBMETHOD` VARCHAR( 40 ) DEFAULT '',
  `DATE` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
   PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `pi_ratepay_rate_details` (
`OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
`ORDERID` VARCHAR(255) NOT NULL ,
`TOTALAMOUNT` DOUBLE NOT NULL ,
`AMOUNT` DOUBLE NOT NULL ,
`INTERESTAMOUNT` DOUBLE NOT NULL ,
`SERVICECHARGE` DOUBLE NOT NULL ,
`ANNUALPERCENTAGERATE` DOUBLE NOT NULL ,
`MONTHLYDEBITINTEREST` DOUBLE NOT NULL ,
`NUMBEROFRATES` DOUBLE NOT NULL ,
`RATE` DOUBLE NOT NULL ,
`LASTRATE` DOUBLE NOT NULL,
`CHECKOUTTYPE` VARCHAR(255) DEFAULT '',
`OWNER` VARCHAR(255) DEFAULT '',
`BANKACCOUNTNUMBER` VARCHAR(255) DEFAULT '',
`BANKCODE` VARCHAR(255) DEFAULT '',
`BANKNAME` VARCHAR(255) DEFAULT '',
`IBAN` VARCHAR(255) DEFAULT '',
`BICSWIFT` VARCHAR(255) DEFAULT '',
PRIMARY KEY  (`OXID`)
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `pi_ratepay_debit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(256) NOT NULL,
  `owner` blob NOT NULL,
  `accountnumber` blob NOT NULL,
  `bankcode` blob NOT NULL,
  `bankname` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_rechnung', 1, 'RatePAY Rechnung', 0, 'abs', 0, 20, 1500, '', 1, 'RatePAY Rechnung', '', '', '', '', '', '', '', '', '', 0, '');

INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_rate', 1, 'RatePAY Rate', 0, 'abs', 0, 200, 2000, '', 1, 'RatePAY Rate', '', '', '', '', '', '', '', '', '', 0, '');

INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_elv', 1, 'RatePAY Lastschrift', 0, 'abs', 0, 20, 1500, '', 1, 'RatePAY Lastschrift', '', '', '', '', '', '', '', '', '', 0, '');

INSERT INTO `oxvoucherseries` (`OXID`, `OXSHOPID`, `OXSERIENR`, `OXSERIEDESCRIPTION`, `OXDISCOUNT`, `OXDISCOUNTTYPE`, `OXSTARTDATE`, `OXRELEASEDATE`, `OXBEGINDATE`, `OXENDDATE`, `OXALLOWSAMESERIES`, `OXALLOWOTHERSERIES`, `OXALLOWUSEANOTHER`, `OXMINIMUMVALUE`, `OXCALCULATEONCE`) VALUES ('Anbieter Gutschrift', 'oxbaseshop', 'Anbieter Gutschrift', 'Anbieter Gutschrift', '0.00', 'absolute', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1', '1', '0.00', '0');

INSERT INTO `pi_ratepay_settings` (`profile_id`, `security_code`, `type`) VALUES ('', '', 'invoice');
INSERT INTO `pi_ratepay_settings` (`profile_id`, `security_code`, `type`) VALUES ('', '', 'elv');
INSERT INTO `pi_ratepay_settings` (`profile_id`, `security_code`, `type`, `invoice_field`) VALUES ('', '', 'installment', 'Bei Fragen zur Rechnung wenden Sie sich bitte an \\r\\nTel 012/34567 ● Fax 012/345678 ● testshop@ratepay.de');
