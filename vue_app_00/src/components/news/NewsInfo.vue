<template>
    <div class="app-newsinfo">
        <h2>{{info.title}}</h2>
        <img :src="info.img_url">
        <p>{{info.content}}</p>
        <p class="share">
            转发到:<a><span class="mui-icon mui-icon-weixin"></span></a>
					<a><span class="mui-icon mui-icon-pengyouquan"></span></a>
					<a><span class="mui-icon mui-icon-qq"></span></a>
        </p>
        <h3>{{info.ctime | datatimeFilter}}</h3>
        <h3>点击 {{info.point}} 次数</h3>
        <comment-box :id="id"></comment-box>
    </div>
</template>
<script>
    import comment from "../sub/comment.vue"
    export default {
        created(){
            this.getNewsInfo();
        },
        data(){
            return {
                id:this.$route.query.id,
                info:{}
            }
        },
        methods:{
            getNewsInfo(){
                var id=this.$route.query.id;
                this.$http.get("NewsInfo?id="+id).then(result=>{
                    this.info=result.body.data[0];
                    console.log(result);
                })
            }
        },
        components:{
            "comment-box":comment
        }
    }
</script>
<style>
    .app-newsinfo h2{
        font-weight:900;
        font-size:1.4rem;
        margin-bottom:20px;
    }
    .app-newsinfo img{
        width:100%;
        height:auto;
        margin-bottom:15px;
    }
    .app-newsinfo p{
        font-size:1rem;
        color:#222;
        margin-bottom:20px;
    }
    .app-newsinfo textarea{
        width:100%;
        height:100px;
        border-top:2px solid #f00;
    }
    .app-newsinfo .share{
        background:#eaeaea;
        width:100%;
        height:32px;
        margin-bottom:20px;
        text-align:right;
        font-weight:bold;
        font-size:1rem
    }
    .app-newsinfo div a {
		
        margin-right:5px;
		width: 25px;
		height: 25px;
		display: inline-block;
		background-color: #fff;
		border: 1px solid #ddd;
		border-radius: 25px;
		background-clip: padding-box;
        color: #8F8F94;
	}
    .app-newsinfo .share a  {
		margin-left:5px;
    }
</style>