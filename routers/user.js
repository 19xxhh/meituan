const express=require("express");
// 引入连接池
const pool=require("../pool.js");
var router=express.Router();
// 1 用户注册
router.post('/reg',function(req,res){
	var obj=req.body;
	if(!obj.uname){
		res.send({code:401,msg:'uname required'});
		return;
	}if(!obj.upwd){
		res.send({code:402,msg:'upwd required'});
		return;
	}if(!obj.email){
		res.send({code:403,msg:'email required'});
		return;
	}if(!obj.phone){
		res.send({code:404,msg:'phone required'});
		return;
	}
	pool.query('INSERT INTO mt_user SET?',[obj],function(err,result){
		if(err) throw err;
		console.log(result);
		// 判断是否插入成功
		if(result.affectedRows>0){
			res.send({code:200,msg:'reg success'});
		}
	});
});


// 2 登录
router.post("/v1/login",(req,res)=>{
	//1.获取用户名称
	var $uname=req.body.uname;
	var $upwd=req.body.upwd;
	console.log($uname+"...."+$upwd);
	var sql="select * from mt_user where uname=? and upwd=?";
	pool.query(sql,[$uname,$upwd],(err,result)=>{
		if(result.length>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});



// 3 用户详情
router.get("/detail",function(req,res){
	var obj=req.query;
	if(!obj.uid){
		res.send({code:401,msg:'uid required'});
		return;
	}
	pool.query("select*from mt_user where uid=?",[obj.uid],function(err,result){
		if(err) throw err;
		res.send(result);
	});
});



// 4用户列表
router.get("/v1/userlist",(req,res)=>{
	var sql="select * from mt_user";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send(result);
	});
})

// 5 删除
router.delete("/v1/deluser/:uid",(req,res)=>{
	var $uid=req.params.uid;
	var  sql="delete from mt_user where uid=?";
	pool.query(sql,[$uid],function(err,result){
		if(err) throw err;
		res.send("1");
	});
});


// 6 修改用户
router.put("/v1/update",(req,res)=>{

	//获取参数
	var $uid=req.body.uid;
	var $uname=req.body.uname;
	var $email=req.body.email;
	var $phone=req.body.phone;
	var $user_name=req.body.user_name;
	var $gender=req.body.gender;
	//非空验证
	if(!$uid){res.send("uid未接收到");return;}
	if(!$uname){res.send("uname未接收到");return;}
	if(!$email){res.send("email未接收到");return;}
	if(!$phone){res.send("phone未接收到");return;}
	if(!$user_name){res.send("user_name未接收到");return;}
	if(!$gender){res.send("gender未接收到");return;}
	var sql="update xz_user set uname=?,email=?,phone=?,user_name=?,gender=? where uid=?";
	pool.query(sql,[$uname,$email,$phone,$user_name,$gender,$uid],(err,result)=>{
		if(err) throw err;
		res.send("1");//1代表修改成功
	});  
});














module.exports=router;