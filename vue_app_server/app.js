const express=require("express");
const pool=require("./pool")
var app=express();
const cors=require("cors"); 
const session=require("express-session");
app.use(cors({
    origin:["http://127.0.0.1:3002","http://localhost:3002"] ,
    credentials:true
})) 
app.listen(3000);
app.use(express.static(__dirname+"/public"));
app.use(session({
    secret:"128位随机字符",
    resave:false,
    saveUninitialized:true,
    cookie:{
        maxAge:1000 * 60 * 60 * 24
    }
}))
app.get("/imagelist",(req,res)=>{
    var obj=[
        {id:1,img_url:"http://127.0.0.1:3000/img/banner1.png"},
        {id:2,img_url:"http://127.0.0.1:3000/img/banner2.png"},
        {id:3,img_url:"http://127.0.0.1:3000/img/banner3.png"},
        {id:4,img_url:"http://127.0.0.1:3000/img/banner4.png"},
    ];
    res.send(obj);
})

app.get("/title",(req,res)=>{
    var obj=[
        {id:1,img_url:"http://127.0.0.1:3000/img/biaozhi.png"}
    ];
    res.send(obj);
})

//功能二:新闻分页显示
app.get("/newslist",(req,res)=>{
    //1.获取参数
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    //2.设置默认值 1 7
    if(!pno){pno=1}
    if(!pageSize){pageSize=7}
    //3.创建正则表达式验证用户输入验证
    var reg=/^[0-9]{1,3}$/;
    //4.如果出错停止函数运行
    if(!reg.test(pno)){
        res.send({code:-1,msg:'页码格式不正确'});
        return;
    }
    if(!reg.test(pageSize)){
        res.send({code:-1,msg:'页大小格式不正确'});
        return;
    }

    var progress=0;
    var obj={code:1};
    //5.创建sql1 查询总记录数
    var sql="SELECT count(id) AS c FROM nba_news";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        var pageCount=Math.ceil(result[0].c/pageSize);
        progress+=50;
        obj.pageCount=pageCount;
        if(progress==100){
            res.send(obj);
        }
    });
    //6.创建sql2 查询当前页内容
    var sql="SELECT id,title,ctime,img_url,";
    sql+=" point,content";
    sql+=" FROM nba_news";
    sql+=" LIMIT ?,?";
    var offset=parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
    pool.query(sql,[offset,pageSize],(err,result)=>{
        if(err)throw err;
        progress+=50;
        obj.data=result;
        if(progress==100){
            res.send(obj);
        }
    })
    //7.返回结果
})

//功能三:查找一条新闻详细信息
app.get("/newsinfo",(req,res)=>{
    //1.id
    var id=req.query.id;
    //2.sql 
    var sql="SELECT id,title,content,point,ctime,img_url FROM nba_news WHERE id=?";
    //3.json
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err
        res.send({code:1,data:result});
    })
})

//功能四: 分页查找指定新闻下评论列表
app.get('/getcomment',(req,res)=>{
    //1:获取参数
   var pno = req.query.pno;
   var pageSize = req.query.pageSize;
   var nid=req.query.nid;
   //2:设置默认值 1 7
   if(!pno){pno = 1}
   if(!pageSize){pageSize=7}
   //3:创建正则表达式验证用户输入验证
   var reg = /^[0-9]{1,3}$/;
   //4:如果错出停止函数运行
   if(!reg.test(pno)){
      res.send({code:-1,msg:"页编格式不正确"});
      return;
   }
   if(!reg.test(pageSize)){
      res.send({code:-2,msg:"页大小格式不正确"});
      return;
   }
  
   var progress = 0;
   var obj = {code:1};
   obj.uname=req.session.uname;
   //5:创建sql1 查询总记录数   严格区分大小写
   var sql = "SELECT count(id) AS c FROM nba_comment WHERE nid=?";
   pool.query(sql,[nid],(err,result)=>{
     if(err)throw err;
     var pageCount = Math.ceil(result[0].c/pageSize);
     progress+=50;
     obj.pageCount = pageCount;
     if(progress==100){
       res.send(obj);
     }
   });
   //6:创建sql2 查询当前页内容 严格区分大小写
   var sql =" SELECT id,user_name,ctime,content ";     
       sql+=" FROM nba_comment WHERE nid=? ";
       sql+=" ORDER BY id DESC";
       sql+=" LIMIT ?,?";
   var offset = parseInt((pno-1)*pageSize);
       pageSize = parseInt(pageSize);
   pool.query(sql,[nid,offset,pageSize],(err,result)=>{
     if(err)throw err;
     progress+=50;
     obj.data=result;
     if(progress==100){
       res.send(obj);
     }
   })
  })
  const bodyParser=require("body-parser");
  app.use(bodyParser.urlencoded({
    extended:false
  }))
  //功能五：发表评论
  app.post("/addComment",(req,res)=>{
    //1.获取三个参数
    var nid=req.body.nid;
    var user_name=req.session.uname;
    var content=req.body.content;
    console.log(nid+':'+content+':'+user_name)
  
    //2.创建sql语句
    var sql="INSERT INTO `nba_comment`(`id`, `nid`, `user_name`, `ctime`, `content`) VALUES (null,?,?,now(),?)";
    nid=parseInt(nid);
    //3.返回添加结果
    pool.query(sql,[nid,user_name,content],(err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"评论发表成功!"});
    })
  })

//功能六:查询商品列表
app.get("/goodslist",(req,res)=>{
    var obj = [];
    obj.push({id:1,title:"NIKE Kyrie3",old:799,now:690,img_url:'http://127.0.0.1:3000/img/good1.png'});
    obj.push({id:2,title:"Adidas Dame4",old:999,now:870,img_url:'http://127.0.0.1:3000/img/good2.png'});
    obj.push({id:3,title:"NIKE Kobe10 Elite",old:1399,now:1100,img_url:'http://127.0.0.1:3000/img/good3.png'});
    obj.push({id:4,title:"Air Jordan XXX",old:1599,now:1280,img_url:'http://127.0.0.1:3000/img/good4.png'});
    obj.push({id:5,title:"Adidas Crazy Explosive",old:1299,now:779,img_url:'http://127.0.0.1:3000/img/good5.png'});
    obj.push({id:6,title:"Air Jordan XXXII",old:1399,now:1050,img_url:'http://127.0.0.1:3000/img/good6.png'});
    obj.push({id:7,title:"Adidas D Rose9",old:899,now:789,img_url:'http://127.0.0.1:3000/img/good7.png'});
    obj.push({id:8,title:"Adidas Dame3",old:899,now:520,img_url:'http://127.0.0.1:3000/img/good8.png'});
    res.send(obj);
  });





//功能七:查询商品详情
app.get("/goodsInfo",(req,res)=>{
    var id=req.query.id;
    var sql="SELECT title,old,new,img_url FROM nba_laptop WHERE lid=?";
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,data:result});
    })
})

//功能八:用户登录
app.get("/login",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var sql="SELECT count(id) AS c FROM nba_login WHERE uname=? AND upwd=md5(?)";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err)throw err;
        var obj=result[0].c;
        if(obj==1){
            req.session.uname=uname;
            res.send({code:1,msg:"登录成功"});
        }else{
            res.send({code:-1,msg:"用户名或密码有误"})
        }
    });
})

app.get("/addCart",(req,res)=>{
    //1:获取3个参数
    //需要第三方模块支持 bodyParser
    var uid = req.query.uid;
    var pid = req.query.pid;
    var c = req.query.count;
    //2:创建sql语句
    var sql  =" INSERT INTO `nba_shoppingcart_item`(`iid`, `user_id`, `product_id`, `count`, `is_checked`) VALUES (null,?,?,?,0)"
  
    pool.query(sql,[uid,pid,c],(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"购物车添加成功"});
    });
    //3:返回添加结果
  })

//功能九:查询购物详细信息
app.get("/getCarts",(req,res)=>{
    var lid=req.query.lid;
    var sql="SELECT c.iid,c.user_id,c.count,p.new,p.lname,p.img_url FROM nba_laptop p,nba_shoppingcart_item c WHERE p.lid=c.product_id AND c.user_id=?";
    lid=parseInt(lid);
    pool.query(sql,[lid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,data:result});
    })
})

// 功能十:更新购物数量
app.get("/updateCart",(req,res)=>{
    var iid=req.query.iid;
    var count=req.query.count;
    var sql="UPDATE nba_shoppingcart_item set count=? WHERE iid=?";
    iid=parseInt(iid);
    count=parseInt(count);
    pool.query(sql,[count,iid],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"数量修改成功"});
        }else{
            res.send({code:-1,msg:"数量修改失败"})
        }
        
    })
})

//功能十一:搜索商品
app.get("/search",(req,res)=>{
    var keyword=req.query.keyword;
    var low=req.query.low;
    var high=req.query.high;
    var sql="SELECT lid,lname,new,img_url FROM nba_laptop WHERE lname LIKE ? AND new>=? AND new<=?";
    // low=parseFloat(low);
    // high=parseFloat(high);
    pool.query(sql,[`%${keyword}%`,low,high],(err,result)=>{
        if(err)throw err;
        if(result.length==0){
            res.send({code:-1,msg:"您搜索商品不存在哦"});
        }else{
            res.send({code:1,data:result})
        }
    })
})

//功能十二:选秀
app.get("/showlist",(req,res)=>{
    var sql =" SELECT mid,team_img,star_img,tname,mname,position,weight,birthday,city,best,worst,content,play,time,score,bank,holding,steal,block,mistake ";     
    sql+=" FROM nba_show ";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,data:result});
    })
})

//功能十三:赛程
app.get("/play",(req,res)=>{
    var sql=" SELECT pid,left_team,left_img,left_score,right_score,right_img,right_team FROM nba_play";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,data:result});
    })
})

//功能十四:注册
app.get("/login",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var sql="SELECT count(id) AS c FROM nba_login WHERE uname=? AND upwd=md5(?)";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err)throw err;
        var obj=result[0].c;
        if(obj==1){
            req.session.uname=uname;
            res.send({code:1,msg:"登录成功"});
        }else{
            res.send({code:-1,msg:"用户名或密码有误"})
        }
    });
})

//功能十五 虎扑社区 虎扑模块
app.get("/hupu",(req,res)=>{
    var sql="SELECT cid,cop FROM nba_hupu";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:result});
    })
});

//功能二2：获取默认详情
app.get('/hupuList',(req,res)=>{
    var sql='SELECT bid,cid,title,img_url FROM nba_hupu_list WHERE cid=1 LIMIT 0,6';
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result)
    })
})

//功能三：获取电子书列表，并进行分页
app.get('/hupusList',(req,res)=>{
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    var cid=req.query.cid;
    if(!pno){pno=1};
    if(!pageSize){pageSize=7};
    var reg=/^[0-9]{1,3}$/;
    if(!reg.test(pno)){
        res.send({code:-1,msg:'页码格式不正确！'})
    };
    if(!reg.test(pageSize)){
        res.send({code:-2,msg:'页大小格式不正确'})
        return;
    }; 
    var progress=0;
    var obj={};   
    //查询总记录数
    var sql='SELECT count(bid) AS c FROM nba_hupu_list WHERE cid=?' ;
    pool.query(sql,cid,(err,result)=>{
        if(err) throw err;
        var pageCount=Math.ceil(result[0].c/pageSize);
        progress+=50;
        obj.pageCount=pageCount;
        if(progress==100){
            res.send(obj);
        }
    });

       //查询被选中的类别中的数据
       var sql='SELECT bid,cid,title,img_url FROM nba_hupu_list WHERE cid=? LIMIT ?,?' ;
       var offset=parseInt((pno-1)*pageSize);
           pageSize=parseInt(pageSize);
       pool.query(sql,[cid,offset,pageSize],(err,result)=>{
           if(err) throw err;
           progress+=50;
           obj.data=result;
           if(progress==100){
               res.send(obj)
           }
       })
   });

//功能十六 球队排名
app.get("/rank",(req,res)=>{
    var sql="SELECT rid,img_url,team,gains FROM nba_rank";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:result});
    })
})

//功能十六  注册页面的效验--用户名
app.get('/checkUname',(req,res)=>{
    var uname=req.query.uname;
    var reg=/^[A-Za-z0-9]{1,8}$/
    if(!reg.test(uname)){
        res.send({code:-1,msg:'用户名格式不正确！'}); 
        return;             
    }
    var sql='SELECT count(uname) AS c FROM `nba_login` WHERE uname=?';
    pool.query(sql,uname,(err,result)=>{        
        if(err) throw err; 
        if(result[0].c==0){
            res.send({code:1,msg:'用户名输入正确！'})
        }else{
            res.send({code:-2,msg:'该用户名已注册！'})
        }
        
    })
})


//功能十七  注册页面的效验--邮箱
app.get('/checkEmail',(req,res)=>{
    var email=req.query.email;    
    var sql='SELECT count(email) AS c FROM `nba_login` WHERE email="?"';
    pool.query(sql,email,(err,result)=>{        
        if(err) throw err; 
        if(result[0].c==0){
            res.send({code:1,msg:'邮箱输入正确！'})
        }else{
            res.send({code:-1,msg:'该邮箱已注册！'})
        }        
    })
})

//功能十八  注册页面信息提交
app.post('/register',(req,res)=>{
    var uname=req.body.uname;
    var upwd=req.body.upwd;
    var email=req.body.email;
    console.log(uname,upwd,email)
    var sql='INSERT INTO `nba_login`(`id`, `uname`, `upwd`, `email`) VALUES (null,?,md5(?),?)';
    pool.query(sql,[uname,upwd,email],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:'注册成功'})
    })
})
