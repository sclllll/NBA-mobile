<template>
    <div class="app-rank">
        <div class="direction">
            <div>西部</div>
            <hr>
            <div>东部</div>
        </div>
        <div class="area">
            <div class='area-item' v-for="item in list" :key="item.rid"><img :src='item.img_url'></img><p>{{item.team}}</p><p class='gains'>{{item.gains}}</p></div>
        </div>
        <div class="team"></div>
    </div>
</template>
<script>
    export default {
        created() {
            this.getRank();
        },
        data(){
            return{
                list:[]
            }
        },
        methods:{
            getRank(){
                var url="http://127.0.0.1:3000/rank";
                this.axios.get(url).then(result=>{
                    this.list=result.data.msg;
                })
            }
        }
    }
</script>
<style>
    *{padding:0;margin:0;}
    .app-rank .area{
        flex-direction:column;
        display:flex;
        width:290px;
        float:left;
        font-size:0.8rem;
    }
    .app-rank .area>div{
        border-radius: 10px;
        color: #999;
        background-color: #efeff4;
        display: inline-block;
        text-align:center;
        width:33.3%;
        margin-top:5px;
        margin-bottom:5px;
    }
    .app-rank .direction{
        flex-direction:column;
        display:flex;
        width:80px;
        float:left;
    }
    .app-rank:after{
        content:'';
        display:block;
        clear:both;
    }
    .app-rank .direction>div:first-child,.app-rank .direction>div:last-child{
        height: 126px;
        width: 80px;
        text-align: center;
        padding-top: 108px;
        font-size: 14px;
        font-weight: 700;
        margin-top:2rem;
        margin-bottom:7rem;
    }
    .app-rank .area{
        display:flex;
        flex-direction:row;
        align-items:center;
        justify-content:center;
        height:80px;
        flex-wrap:wrap;
        width:295px;
    }
    .area .area-item{
        width:32%;
        height:80px;
    }
    .area .area-item img{
        width:30%;
    }
    .area .area-item p{
        margin:0 auto;
        font-size:5px;
    }
    .area .area-item .gains{
        width:90px;
    }
</style>