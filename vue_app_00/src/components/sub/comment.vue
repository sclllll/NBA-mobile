<template>
    <div class="app-comment">
        <h3>网友评论</h3>
        <textarea placeholder="我来说两句" maxlength="120" v-model="msg"></textarea>
        <mt-button size="large" @click="postComment" type="primary">发表评论</mt-button>
        <h3>最新评论</h3>
        <div class="cmt-list">
            <div class="cmt-item" v-for="(item,i) in list" :key="item.id">
                <div class="cmt-info">
                    第 {{i+1}} 楼: 用户名:{{item.user_name}}
                    发表时间:{{item.ctime | datatimeFilter}}
                    <div class="cmt-body">
                        {{item.content}}
                    </div>
                </div>
            </div>
        </div>
        <mt-button size="large" @click=getMore type="primary">加载更多</mt-button>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        created() {
           this.getMore(); 
        },
        methods:{
            postComment(){
                var msg=this.msg;
                var nid=this.id;
                var user_name="";
                var size=msg.trim().length;
                if(size==0){
                    Toast("评论内容不能为空")
                    return;
                }
                var url="addComment";
                var obj={nid:nid,user_name:user_name,content:msg};
                this.$http.post(url,obj).then(result=>{
                    var obj=result.body;
                    if(obj.code==1){
                        Toast("评论发表成功");
                        this.pno=0;
                        this.list=[];
                        this.getMore();
                    }else{
                        Toast("评论发表失败")
                    }
                })
            },
            getMore(){
                var nid=this.id;
                this.pno++;
                var pno=this.pno;
                var pageSize=this.pageSize;
                var url="getcomment?pno="+pno+"&nid="+nid+"&pageSize="+pageSize;
                this.$http.get(url).then(result=>{
                    var rows=this.list.concat(result.body.data);
                    this.list=rows;
                });
            }
        },
        data(){
            return {
                list:[],
                pno:0,
                pageSize:7,
                pageCount:1,
                msg:""
            }
        },
        props:["id"]
    }
</script>
<style>
    .app-comment h3{
        font-size:24px;
        color:#222;
        font-family:华文行楷;
        margin-top:20px;
    }
    .app-comment textarea{
        font-size:14px;
        height:68px;
        margin:0;
    }
    .app-comment .cmt-list{
        margin:5px 0;
    }
    .app-comment .cmt-list .cmt-item{
        border:1px solid #aaa;
        margin-top:15px;
    }
    .app-comment .cmt-list .cmt-info{
        line-height:30px;
        background:#ccc;
    }
</style>