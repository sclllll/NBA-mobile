<template>
    <div class='app-hupu'>        
        <header class="mui-bar mui-bar-nav">
			<h1 class="tit">虎扑社区热帖</h1>
		</header>
		<div class="mui-content mui-row mui-fullscreen">
			<div class="mui-col-xs-3">
				<div id="segmentedControls" class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-vertical">
				<a class="mui-control-item" v-for="item in list" :key="item.cid" :data-id='item.cid'>{{item.cop}}</a>       
				</div>
			</div>
			<div id="segmentedControlContents" class="mui-col-xs-9" style="border-left: 1px solid #c8c7cc;">
				<div class='mui-control-content'>
					<ul class='mui-table-view'>
						<li class='mui-table-view-cell mui-media' v-for='ob in obj' :key='ob.bid'>
							<a href="">
								<img class="mui-media-object mui-pull-left" :src="ob.img_url">
								<div class="mui-media-body">
									<span class='title'>{{ob.title}}</span>
								</div>
							</a>
						</li>
					</ul>    	
				</div>
			</div>
		</div>
	</div>
</template>
<script>	
    /* mui.init({
		swipeBack: true //启用右滑关闭功能
	});
   */   
    export default {
        data(){
            return {
                list:[],
                obj:[],
				cid:1,
				pageSize:6,
				pno:1,
				pageCount:1
			}
        },		
        methods:{
			getHupu(){
				var url="http://127.0.0.1:3000/hupu"
				this.axios.get(url).then(result=>{
					console.log(result)
					this.list=result.data.msg
				})
			},
			getHupuList(){				
				this.$http.get('hupuList').then(result=>{
					this.obj=result.body;
				})
			},
			getHupusList(){	
				var pageSize=this.pageSize
				var pno=this.pno
				var sge=document.querySelector('#segmentedControls')
				sge.onclick=(e,cid)=>{
					var a=e.target
					cid=a.dataset.id
					this.cid=cid								
					var url='hupusList?cid='+cid+'&pno='+pno+'&pageSize='+pageSize;		
					this.$http.get(url).then(result=>{
					this.obj=result.data.data;
					this.pageCount=result.body.pageCount;									
					})
				}	
			}
        },
        created(){
		  this.getHupu();
		  this.getHupuList();						
        },
		mounted(){			
			this.getHupusList();						
        },
    }


</script>


<style>
   .mui-row.mui-fullscreen>[class*="mui-col-"] {
				height: 92%;
			}
			
			.mui-col-xs-3,
			.mui-col-xs-9 {
				overflow-y: auto;
				height: 100%;

			}							
			.mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active {
				background-color: #fff;
			} 
			.title {
				margin: 20px 15px 10px;
				color: #6d6d72;
				font-size: 15px;
			}		
		#segmentedControlContents .mui-table-view .mui-table-view-cell a img.mui-media-object{
			width:100px;
			height:auto;
			margin-right:10px;
			line-height:42px;
			
		}		
		#segmentedControlContents .mui-table-view .mui-media-body .title{
			font-size:16px;
			font-weight:bold;
			margin-left:0;
		}
		.tit{
			font-size:20px;
			text-align:center;
			padding-top:8px;
		}
		
</style>