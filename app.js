const express=require('express');
//引入用户路由器
const userRouter=require('./routers/user.js');
//引入body-parser中间件
const bodyParser=require('body-parser');
var app=express();
app.listen(8080);

//托管静态资源到public目录下
app.use( express.static('public') );
//使用body-parser中间件
app.use( bodyParser.urlencoded({
  extended:false  
}) );

//使用路由器,

app.use( '/user',userRouter );






