<template>
    <div class="app-cart">
        <div class="mui-card">
			<div class="mui-card-header">商品列表</div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
				    <ul class="mui-table-view">
				        <li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.lid">
					        <a href="javascript:;">
						        <img class="mui-media-object mui-pull-left" src="">
						        <div class="mui-media-body">
							    {{item.lname}}
							    <p class='mui-ellipsis'><span class="price"><img :src="item.img_url" alt=""></span>
                                    <span class="count">
                                        <div class="mui-numbox">
					                        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="cartSub" :data-iid="item.iid">-</button>
					                        <input class="mui-input-numbox" type="number" :value="item.count"/>
					                        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="cartAdd" :data-iid="item.iid">+</button>
				                        </div>
                                    </span>
                                </p>
						        </div>
					        </a>
				        </li>
                    </ul>	
				</div>
			</div>
			<div class="mui-card-footer">合计:{{getSubTotal}}</div>
		</div>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return{
                list:[]
            }
        },
        methods:{
            updateCart(iid,count) {
                var url="http://127.0.0.1:3000/updateCart?iid="+iid+"&count="+count;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        Toast(result.data.msg);
                    }else{
                        Toast(result.data.msg);
                    }
                })
            },
            cartSub(e){
                var iid=e.target.dataset.iid;
                for(var item of this.list){
                    if(item.iid==iid && item.count >1){
                        item.count--;
                        this.updateCart(iid,item.count);
                        break;
                    }
                }
            },
            cartAdd(e){
                var iid=e.target.dataset.iid;
                for(var item of this.list){
                    if(item.iid==iid && item.count <999){
                        item.count++;
                         this.updateCart(iid,item.count);
                        break;
                    }
                }
            },
            getMore(){
                var url="http://127.0.0.1:3000/getCarts?lid=1"
                this.axios.get(url).then(result=>{
                    this.list=result.data.data;
                })
            }
        },
        created() {
            this.getMore();
        },
        computed:{
            getSubTotal:function(){
                var sum=0;
                for(var item of this.list){
                    sum+=item.new*item.count;
                }
                return sum;
            }
        }
    }
</script>
<style>
    .mui-media-body{
        margin-top:10px;
    }
    .count>.mui-numbox{
        margin-bottom:35px;
        margin-left:10px;
    }
    .price>img{
        width:25%;
        height:auto;
        padding-top:5px;
    }
</style>