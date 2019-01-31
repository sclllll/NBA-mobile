<template>
    <div class="app-play">
        <div class='tod'>今天是12月15日 星期六</div>
        <div class='sco' v-for="item in list" :key="item.pid">
            <div>
                <span>{{item.left_team}}<img :src="item.left_img" alt=""></span>
                <span>{{item.left_score}}</span>
                <span>-</span>
                <span>{{item.right_score}}</span>
                <span><img :src="item.right_img" alt="">{{item.right_team}}</span>
            </div>
            <div>已结束</div>
        </div>
        
    </div>
</template>
<script>
    export default {
        created() {
            this.getPlay();
        },
        data(){
            return{
                list:[]
            }
        },
        methods:{
            getPlay(){
                var url="http://127.0.0.1:3000/play";
                this.axios.get(url).then(result=>{
                    console.log(result);
                    this.list=result.data.data;
                })
            }
        }
    }
</script>
<style>
    .app-play .tod{
        font-size:0.8rem;
        margin:0 auto;
        border:5px solid #ccc;
        width:45%;
        text-align:center;
        line-height:1.5rem;
        height:2rem;
        background:#ccc;
        margin-bottom:1rem;
        margin-top:1rem;
    }
    .app-play .sco{
        background:#fff;
        margin-bottom:1rem;
        height:4rem;
        line-height:2rem;
    }
    .app-play .sco div>span:first-child{
        margin-right:2.5rem;
        margin-left:2rem;
        
    }
    .app-play .sco span:nth-child(2n){
        margin-left:1rem;
        margin-right:1rem;
    }
    .app-play .sco span:last-child{
        margin-left:2rem;
        margin-right:2rem;
    }
    .app-play .sco span>img{
        width:5%;
        height:auto;
        padding-top:5px;
    }
    .app-play .sco div:nth-child(2){
        text-align:center;
        
    }
</style>
