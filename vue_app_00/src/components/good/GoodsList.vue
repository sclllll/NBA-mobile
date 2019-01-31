<template>
    <div class="app-goodslist">
        <div class="goods-item" v-for="item in list" :key="item.id">
            <img :src="item.img_url" @click="jumpDetail" :data-id="item.id"/>
            <h3 class="title">{{item.title}}</h3>
            <div class="info">
                <div class="price">
                    <span class="now">￥{{item.now}}</span>
                    <span class="old">￥{{item.old}}</span>
                </div>
            </div>
            <div class="sell">
                <span>热卖中</span>
                <span>剩1件</span>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        created() {
            this.getMore();
        },
        methods:{
            jumpDetail(even){
                var id=even.target.dataset.id;
                this.$router.push("/goodsinfo/"+id);
            },
            getMore(){
                var url="goodsList";
                this.$http.get(url).then(result=>{
                    this.list=result.body;
                })
            }
        },
        data(){
            return {
                list:[]
            }
        },
    }
</script>
<style>
    .app-goodslist{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        padding:7px;

    }
    .app-goodslist .goods-item{
        width:49%;
        border:1px solid #ccc;
        box-shadow:0 0 8px #ccc;
        margin:4px 0;
        padding:2px;
        display:flex;
        flex-direction:column;
        min-height:210px;
        justify-content:space-between;
        text-align:center;
    }
    .app-goodslist .goods-item h3{
        font-size:18px;
        font-family:"微软雅黑";
        margin-bottom:10px;
    }
    .app-goodslist .goods-item img{
        width:80%;
        height:40%;
        margin-left:1rem;
    }
    .app-goodslist .goods-item .now{
        color:red;
        font-weight:bold;
        font-size:16px;
    }
    .app-goodslist .goods-item .old{
        font-size:12px;
        text-decoration:line-through;
    }
    .app-goodslist .title{
        color:#000;
    }
</style>