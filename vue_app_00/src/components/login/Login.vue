<template>
    <div class="app-login">
        <div class="mui-card">
			<div class="mui-card-header">用户登录</div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					
                        用户名:<input type="text" value="" placeholder="请输入用户名" v-model="uname"/>
                        密码:<input type="password" value=""  placeholder="请输入密码" v-model="upwd"/>
                        <mt-button size="large" @click="handleLogin">登录</mt-button>
                    
				</div>
			</div>
			<div class="mui-card-footer"><router-link to="/reg">新用户注册</router-link></div>
		</div>
    </div>
</template>
<script>
    import {Toast} from "mint-ui"
    export default {
        data() {
            return {
                uname:"",
                upwd:""
            }
        },
        methods:{
            handleLogin(){
                var u=this.uname;
                var p=this.upwd;
                var url="http://127.0.0.1:3000/login?uname="+u+"&upwd="+p;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        this.$router.push("/Home");
                    }else{
                        Toast("用户名或密码有误")
                    }
                })
            }
        }
    }
</script>
<style>
    .app-login .mui-card .mui-card-header{
        font-size:1.5rem;
        font-weight:bold;
    }
    .app-login .mui-card .mui-card-footer a{
        margin-left:15rem;
        font-size:1rem;
    }
</style>