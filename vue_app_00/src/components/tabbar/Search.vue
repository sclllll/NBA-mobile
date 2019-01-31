<template>
    <div class="app-search">
        <div class="mui-card">
			<div class="mui-card-header">
                <input type="text" name="keyword" value="" v-model="keyword" placeholder="关键字">
            </div>
            <div class="mui-card-header">
                <input type="number" name="low" value="" v-model="low" placeholder="下限">
            </div>
            <div class="mui-card-header">
                <input type="number" name="high" value="" v-model="high" placeholder="上限">
            </div>
            <div class="mui-card-header">
               <mt-button type="primary" size="large" @click="handleSearch">搜索</mt-button>
            </div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					显示搜索结果
				</div>
			</div>
			<div class="mui-card-footer">
                <img :src="info.img_url" alt="">
                <span>{{info.lname}}</span>
                <span>{{info.price}}</span>
            </div>
		</div>
    </div>
</template>
<script>
    export default {
        created() {
            
        },
        data(){
            return{
                keyword:"",
                low:"",
                high:"",
                info:{}
            }
        },
        methods:{
            handleSearch(){
                var kw=this.keyword;
                var low=this.low;
                var high=this.high;
                if(low==""){
                    low=0;
                }
                if(high==""){
                    high=2100000000;
                }
                var url="http://127.0.0.1:3000/search?keyword="+kw+"&low="+low+"&high="+high;
                this.axios.get(url).then(result=>{
                    console.log(result);
                    this.info=result.data.data[0];
                    console.log(this.info)
                })
            }
        }
    }
</script>
<style>
    .mui-card-footer img{
        width:30%;
        height:auto;
    }
    .mui-card-footer span{
        color:#000;
        font-weight:bold;
        font-size:1rem;
    }
    .mui-card-footer span:last-child{
        color:#f00;
    }
</style>