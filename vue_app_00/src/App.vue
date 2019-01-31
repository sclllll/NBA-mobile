<template>
 <div class="app-container">
    <!--1.学子商城顶部导航栏-->
    <div class="app-container-img">
		<img :src="info.img_url" alt="">
		<a id="icon-menu" class="mui-action-menu mui-icon mui-icon-bars mui-pull-left" @click='pullDown'></a>
		<div class='bind' v-show="isShow"> 
			<ul class='down'>
				<li><router-link to="/hupu">虎扑社区</router-link></li>
				<li><router-link to="/goodslist">商品列表</router-link></li>
				<li><router-link to="/newslist">新闻列表</router-link></li>
				<li><router-link to="/newsinfo?id=1">新闻评论</router-link></li>
			</ul>
		</div>
	</div>
    <!--2.router-view-->
    <router-view></router-view>
    <!--3.tabbar-->
    <nav class="mui-bar mui-bar-tab">
			<router-link class="mui-tab-item mui-active" to="/Home">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</router-link>
			<router-link class="mui-tab-item" to="/search">
				<span class="mui-icon mui-icon-search"></span>
				<span class="mui-tab-label">搜索</span>
			</router-link>
			<router-link class="mui-tab-item" to="/cart">
				<span class="mui-icon mui-icon-extra mui-icon-extra-gold"><span class="mui-badge"> {{$store.getters.optCartCount}}</span></span>
				<span class="mui-tab-label">购物车</span>
			</router-link>
			<router-link class="mui-tab-item" to="/myself">
				<span class="mui-icon mui-icon-extra mui-icon-extra-heart-filled"></span>
				<span class="mui-tab-label">我的</span>
			</router-link>
		</nav>
 </div>
</template>
<script>
	export default {
		created() {
			this.getTitle();
		},
		data(){
			return {
				info:{},
				isShow:false
			}
		},
		methods:{
			getTitle(){
                this.$http.get("title").then(result=>{
                    this.info=result.body[0];
                })
            },
			pullDown(){
				this.isShow=!this.isShow;
			}
		}
	}
</script>
<style>
   .app-container{
     padding-bottom:50px;
     overflow-x:hidden;
   }
   .app-container .app-container-img{
	   text-align:center;
	   background:#fff;
   }
   .app-container .app-container-img img{
	   width:50%;
	   margin-right:8%
   }
   #icon-menu{
	   margin-top:5%;
	   color:#000;
	   margin-left:5%;
   }
   #icon-menu-undo{
	   color:#000;
	   margin-top:5%;
	   margin-right:5%;
   }
   .bind{
	  
   }
   .bind .down>li{
	   background:#000;
	   height:50px;
	   line-height:50px;
   }
   .bind .down>li>a{
	   color:#fff;
   }
</style>
