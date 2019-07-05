SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS mt;
#创建数据库
CREATE DATABASE mt CHARSET=UTF8;
#进入数据库
USE mt;

#***用户信息表***
CREATE TABLE mt_user(
uid INT  PRIMARY KEY AUTO_INCREMENT,
uname VARCHAR(32),
upwd VARCHAR(32),
email VARCHAR(32),
phone VARCHAR(32) NOT NULL UNIQUE,
user_name VARCHAR(32),
gender BOOL
);


#***用户地址***
CREATE TABLE mt_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  postcode CHAR(6),           #邮编
  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

#***用户订单表***
CREATE TABLE mt_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-商家已接单，正在处理  3-配送中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #送出时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

#***用户订单详情表***
CREATE TABLE mt_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);


#***商品类别表***
CREATE TABLE mt_product_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

#***商品表***
CREATE TABLE mt_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  pname VARCHAR(32),          #商品名称
  category VARCHAR(32),       #所属分类
  details VARCHAR(1024),      #产品详细说明
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);


#***商品详情图表***
CREATE TABLE mt_product_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,              #笔记本电脑编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);



#***首页轮播图商品***
CREATE TABLE mt_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);


#***首页商品***
CREATE TABLE mt_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);


#插入表数据


#***用户数据***
INSERT INTO mt_user VALUES(null,'aa','0000','0000@qq.com','13112345678','张小琴',0);
INSERT INTO mt_user VALUES(null,'bb','1111','1111@qq.com','13212345678','张小丽',0);
INSERT INTO mt_user VALUES(null,'cc','2222','2222@qq.com','13312345678','张小航',1);
INSERT INTO mt_user VALUES(null,'dd','3333','3333@qq.com','13412345678','张小刚',1);
INSERT INTO mt_user VALUES(null,'ee','4444','4444@qq.com','13512345678','张小宝',1);
INSERT INTO mt_user VALUES(null,'ff','5555','5555@qq.com','13612345678','张小娟',0);
