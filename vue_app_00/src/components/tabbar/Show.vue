<template>
    <div class="app-show">
        <ul class="choose">
            <li v-for="(item,i) in list" :key="item.mid">
                <div class="head">
                    <div><img :src="item.team_img" alt=""></div>
                    <div>
                        <span>{{item.tname}}</span>
                        <p>用<span>{{i+1}}</span>号签选择的球员:</p>
                    </div>    
                </div>
                <div class="body">
                    <div class="star"><img :src="item.star_img" alt=""></div>
                    <div class="info">
                        <p>{{item.mname}}</p>
                        <p>
                            <span>位置:{{item.position}}</span>
                            <span>身高/体重:{{item.weight}}</span>
                        </p>
                        <p>
                            <span>生日:{{item.birthday}}</span>
                            <span>来自:{{item.city}}</span>
                        </p>
                        <p>
                            <span>最佳模板:{{item.best}}</span>
                            <span>最差前景:{{item.worst}}</span>
                        </p>
                        <p>{{item.content}}</p>
                    </div>
                </div>
                <div class="foot">
                    <table>
                        <tr>
                            <th colspan="8">2017-18 NCAA</th>
                        </tr>
                        <tr>
                            <th>场次</th>
                            <th>上场时间</th>
                            <th>得分</th>
                            <th>篮板</th>
                            <th>助攻</th>
                            <th>抢断</th>
                            <th>盖帽</th>
                            <th class="spe">失误</th>
                        </tr>
                        <tr>
                            <td>{{item.play}}</td>
                            <td>{{item.time}}</td>
                            <td>{{item.score}}</td>
                            <td>{{item.bank}}</td>
                            <td>{{item.holding}}</td>
                            <td>{{item.steal}}</td>
                            <td>{{item.block}}</td>
                            <td class="spe">{{item.mistake}}</td>
                        </tr>
                    </table>
                </div>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        created() {
            this.getShow();
        },
        data(){
            return {
                list:[],
            }
        },
        methods:{
            getShow(){
                var url="http://127.0.0.1:3000/showlist";
                this.axios.get(url).then(result=>{
                    this.list=result.data.data;
                    console.log(this.list);
                })
            }
        }
    }
</script>
<style>
    .app-show .mui-bar .mui-bar-nav{
        background:#000;
    }
    .app-show .choose li{
        background:#fff; 
    }
    .app-show .head{
        overflow:auto;
        margin-top:-1rem;
    }
    .app-show .head>div{
        float:left;
    }
    .app-show .head>div:first-child{
        text-align:left;
        width:6rem;
        margin-top:1rem;
        margin-left:0.5rem;
        margin-bottom:1.5rem;
    }
    .app-show .head>div:last-child{
        margin-top:1.5rem;
    }
    .app-show .head>div>img{
        width:60%;
        height:auto;
    }
    .app-show .head>div>p>span{
        border-radius:50%;
        padding:0 5px;
        background:#f00;
    }
    .app-show .body{
        overflow:auto;
    }
    .app-show .body>div{
        float:left;
    }
    .app-show .body>div:last-child{
        width:80%;
    }
    .app-show .body .info p:first-child{
        color:#005eac;
        font-size:1.2rem;
        font-weight:bold;
        margin-left:1rem;
    }
    .app-show .body .info p>span:first-child{
        font-size:8px;
        margin-left:1rem;
        font-weight:bold;
    }
    .app-show .body .info p>span:last-child{
        font-size:8px;
        margin-left:0.5rem;
        font-weight:bold;
    }
    .app-show .body .info p:last-child{
        font-size:10px;
        margin-left:1rem;
        font-weight:bold;
    }
    .app-show .choose{
        list-style:none;
        padding-left:0px;
    }
    .foot{
        width:100%;
        height:auto;
        margin-bottom:3rem;
    }
    .foot table{
        height:150px;
        width:100%;
    }
    .foot table tr:first-child{
        background:#08315f;
        color:#fff;
        font-size:1.5rem;
    }
    .foot table tr:first-child th{
        padding-left:10px;
    }
    .foot table tr:nth-child(2){
        font-size:1rem;
        text-align:center;
        border-top:1px solid #000;
        border-bottom:1px solid #000;
    }
    .foot table tr:nth-child(2) th{
        padding-left:10px;
    }
    .foot table tr:last-child{
        font-size:1rem;
        text-align:center;
        border-bottom:1px solid #000;
    }
    .foot table tr:last-child td{
        padding-left:8px;
    }
    .spe{
        padding-right:7px;
    }
    .title{
		color:#fff;
		text-align:center;
		font-size:20px;
		
	}
</style>