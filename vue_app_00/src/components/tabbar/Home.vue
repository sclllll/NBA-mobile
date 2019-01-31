<template>
    <div class="app-home">
        <!--1.顶部导航栏-->
        
        <!--2.轮播图-->
        <mt-swipe :auto="3000">
            <mt-swipe-item v-for="item of list" :key="item.id">
                <img :src="item.img_url"/>
            </mt-swipe-item>
        </mt-swipe>
        <!--3.九宫格-->
        <ul class="mui-table-view mui-grid-view mui-grid-9">
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/hupu">
		                    <img src="../../img/menu1.png" alt="">
		                    <div class="mui-media-body">虎扑社区</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/newslist">
		                    <img src="../../img/menu2.png" alt="">
		                    <div class="mui-media-body">新闻资讯</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/goodslist">
		                    <img src="../../img/menu3.png" alt="">
		                    <div class="mui-media-body">篮球装备</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/play">
		                    <img src="../../img/menu4.png" alt="">
		                    <div class="mui-media-body">最新赛程</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/show">
		                    <img src="../../img/menu5.png" alt="">
		                    <div class="mui-media-body">NBA选秀</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/rank">
		                   <img src="../../img/menu6.png" alt="">
		                    <div class="mui-media-body">分区排名</div></router-link></li>	        
	    </ul> 
        <!--4.tabbar-->
        
    </div>
</template>
<script>
    export default {
        created(){
            this.getImages();
        },
        methods:{
            getImages(){
                this.$http.get("imagelist").then(result=>{
                    this.list=result.body;
                })
            }
        },
        data(){
            return {
                list:[]
            }
        }
    }
</script>
<style>
    .app-home .mint-swipe{
        height:200px;
    }
    .app-home .mint-swipe img{
        width:100%;
    }
    .app-home .mui-grid-view.mui-grid-9{
      background:#fff;
  }
  .app-home .mui-grid-view.mui-grid-9 li{
      border:0;
      
  }
  .app-home .mui-grid-view.mui-grid-9 li div{
      font-family:Helvetica;
  }
    .app-home .muit-grid-view.mui-grid-9 li img{
        width:50px;
        height:50px;
    }
</style> 