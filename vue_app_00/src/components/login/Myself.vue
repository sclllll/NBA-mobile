<template>
    <div>
        <div class='img'>
            <img src="http://127.0.0.1:3000/img/avatar1.png" alt="">
            <div><router-link to='/reg'>注册</router-link>|<router-link to="/login">登录</router-link></div>
        </div>
        <ul class="mar">
			<li class="marg">
				<router-link to="/hupu" >虎扑社区</router-link>
			</li>
			<li class="marg">
				<router-link to="/newslist" >新闻资讯</router-link>
			</li>
		    <li class="marg">
				<router-link to="/goodslist" >篮球装备</router-link>
		    </li>
            <li class="marg">
				<router-link to="/show" >NBA选秀</router-link>
			</li>
		</ul>
    </div>
</template>
<script>
    export default {
        data(){
            return {}
        }
    }
</script>
<style>
    .img{
        text-align:center;
        margin-top:5%;
        margin-bottom:5%;
    }
    .img>img{
        width:30%;
        height:30%;
    }
    .img>div{
        font-size:20px;
        font-weight:bold;
        margin-top:2%;
    }
    .img>div>a{
        color:#000;
    }
    .mar{
        margin-top:12%;
    }
    .mar>.marg{
        text-align:center;
        border-bottom:1px solid #ccc;
        height:60px;
        list-style:none;
        border-top:1px solid #ccc;
        background-color:#fff;
    } 
    .mar>.marg>a{
        color:#000;
        line-height:60px;
    }  
</style>