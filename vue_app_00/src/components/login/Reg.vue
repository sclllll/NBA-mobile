<template>
    <div class="app-reg">
        <div class="mui-card">
			<div class="mui-card-header">新用户注册</div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<input type="text" value="" placeholder="由1-8的数字或字母组成"  class="in1" v-model='uname' @blur='checkUname'><img src="/img/true.png" alt="" v-show='this.unameCode==1'>
                    <input type="password" value=""  placeholder="由3-6位的数字、密码组成"  class="in2" v-model='upwd' @blur='checkUpwd'><img src="/img/true.png" alt="" v-show='this.upwdCode==1'>
                    <input type="password" value=""  placeholder="请确认密码"  class="in4" v-model='mupwd' @blur='checkMupwd'><img src="/img/true.png" alt="" v-show='this.mupwdCode==1'>
                    <input type="text" value="" placeholder="请输入邮箱地址"  class="in3" v-model='email' @blur='checkEmail'><img src="/img/true.png" alt="" v-show='this.emailCode==1'>
                    <div><input type="checkbox" value="ifLike" name="choose" class='check' checked>我已经阅读并同意<span>NBA新闻社区用户协议（含隐私政策）</span></div>
                    
                </div>
			</div>
			<mt-button size="large"type='primary' @click='postMsg'>立即注册</mt-button> 
		</div>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui';
    export default {
        created() {
           
        },
        data(){
           return {
               uname:'',
                upwd:'',
                mupwd:'',
                email:'',
                phone:'',
                unameCode:'',
                upwdCode:'',
                mupwdCode:'',
                emailCode:'' 
           } 
        },
        methods:{
            checkUname(){
                var uname=this.uname;
                var url='checkUname?uname='+uname;
                this.$http.get(url).then(result=>{
                    this.unameCode=result.body.code;
                    if(this.unameCode==-1){
                        Toast(result.body.msg)
                    }else if(this.unameCode==-2){
                        Toast(result.body.msg)
                    }
                })
            },
            checkUpwd(){
                var upwd=this.upwd;
                if(!upwd){
                    Toast('密码不能为空！')
                }
                var reg=/^[0-9]{3,6}$/;
                if(!reg.test(upwd)){
                    Toast('请检查密码格式！')
                }else{
                    this.upwdCode=1;
                }
            },
            checkMupwd(){
                var mupwd=this.mupwd;
                if(!mupwd){
                    Toast('密码位置不能为空')
                };
                var upwd=this.upwd;
                if(upwd==mupwd && upwd  && mupwd){
                    this.mupwdCode=1;
                }else{
                    Toast('两次密码输入不相同')
                }
            },
            checkEmail(){
               var email=this.email;
               var reg=/^[0-9A-Za-z][\.-_0-9A-Za-z]*@[0-9A-Za-z]+(?:\.[0-9A-Za-z]+)+$/ig;
               if(!email){
                   Toast('邮箱不能为空')
                   return
               }
               if(!reg.test(email)){
                   Toast('邮箱格式不正确')
                   return
               }
                var url='checkEmail?email='+email;
                this.$http.get(url).then(result=>{                    
                    this.emailCode=result.body.code;                    
                    if(this.emailCode==-1){
                        Toast(result.body.msg)
                    }else{
                        this.emailCode=1;
                    }
                }) 
            },
            postMsg(){
                var uname=this.uname;
                var upwd=this.upwd;
                var email=this.email;
                var param=`uname=${uname}&upwd=${upwd}&email=${email}`
                var url='http://127.0.0.1:3000/register';
                this.axios.post(url,param).then(result=>{
                    console.log(result.data.code)
                    if(result.data.code==1){
                        Toast('注册成功。');
                        this.$router.push('/login');
                    }else{
                        
                        Toast('注册失败，请重新注册！');
                    }
                })
            }
        }
    }
</script>
<style>
    .app-reg .mui-card .mui-card-content .mui-card-content-inner{
        font-size:0.7rem;
    }
    .mui-card-content-inner .in1,.mui-card-content-inner .in2,.mui-card-content-inner .in3,.mui-card-content-inner .in4{
        width:90%;
        margin-left:4px;
        margin-right:4px;
        font-size:8px;
    }
    .mui-card-content-inner img{
       height:15px;
    }
    .app-reg .mui-card .mui-card-content .mui-card-content-inner>div>span{
        color:#60c3ff;
    }
    .mui-card-footer input{
        width:100%;
    }
</style>