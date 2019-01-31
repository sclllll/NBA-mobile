<template>
    <div class="app-info">
        <div class="mui-card">
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<img :src="info.img_url">	
				</div>
			</div>
		</div>
    <div class="mui-card">
		<div class="mui-card-header">{{info.title}}</div>
		<div class="mui-card-content">
			<div class="mui-card-content-inner">
				<p class="price">
                    市场价:<del>{{(Number(info.old)).toFixed(2)}}</del>
                    销售价:<span class="now">{{(Number(info.new)).toFixed(2)}}</span>
                </p>
                购物数量:<div class="mui-numbox">
					        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="goodSub">-</button>
					        <input class="mui-input-numbox" type="number" value="1" v-model="val"/>
					        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="goodAdd">+</button>
				        </div>
			</div>
		</div>
		<div class="mui-card-footer">
            <mt-button type="primary" size="small" @click="addCart">加入购物车</mt-button>
            <mt-button type="danger" size="small">立即购买</mt-button>
        </div>
	</div>
</div>    
</template>
<script>
    import {Toast} from 'mint-ui'
    import swipe from "../sub/swipe.vue"
    export default {
        created() {
          this.getImages();  
        },
        data(){
            return {
                nid:this.$route.params.id,
                info:{},
                val:1
            }
        },
        methods:{
            addCart(){
                var pid=this.$route.params.id;
                var count=this.val;
                var uid=3;
                var url="http://127.0.0.1:3000/addCart?pid="+pid+"&count="+count+"&uid="+uid;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        this.$store.commit("increment",count)
                        Toast("购物车添加成功")
                    }else{
                        Toast("购物车添加失败")
                    }
                })

            },
            goodSub(){
                if(this.val>1){
                    this.val--
                }
            },
            goodAdd(){
                if(this.val<=998){
                    this.val++ 
                }
            },
            getImages(){
                var aid=this.$route.params.id;
                var url="http://127.0.0.1:3000/goodsInfo?id="+aid;
                this.axios.get(url).then(result=>{
                    
                    this.info=result.data.data[0];
                    console.log(result.data.data[0]);

                })
            }
        },
        components:{
            "swipe-box":swipe
        }
    }
</script>
<style>
    .app-info .mui-card .mui-card-content .mui-card-content-inner img{
        width:100%;
        height:80%;
        border-left:1px solid #fff;
    }
</style>