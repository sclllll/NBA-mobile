import Vue from 'vue'
import App from './App.vue'
import router from './router'

import'mint-ui/lib/style.css'

Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

import './lib/mui/css/app.css'

// 0.1:引入Vuex
import Vuex from "vuex"
// 0.2:注册Vuex组件
Vue.use(Vuex)
// 0.3:创建Vuex实例对象
var store=new Vuex.Store({
  state:{
    cartCount:0
  },
  mutations:{
    increment(state,count){state.cartCount+=count},
    substract(state){state.cartCount--},
    clear(state){state.cartCount=0}
  },
  getters:{
    optCartCount:function(state){
      return state.cartCount;
    }
  }
})
// 0.4:将Vuex对象注册Vue对象

//1:引入mint-ui Header组件
import{Header,Swipe,SwipeItem,Button} from "mint-ui"
//2:注册Header组件
Vue.component(Header.name,Header);
//3.注册Swipe/SwipeItem组件
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);

//3.1引入axios库
import axios from 'axios'
axios.defaults.withCredentials=true
Vue.prototype.axios=axios;
//4.引入vue-resource库
import VueResource from "vue-resource";
//5.注册vue-resource库
Vue.use(VueResource)
//6.配置vue-resource
//6.1设置请求根目录
Vue.http.options.root = "http://127.0.0.1:3000/";
//6:全局设置post 时候表单的数据组织格式为 application/x-www-form-urlencoded
//将提交数据进行转码操作
Vue.http.options.emulateJSON = true;
Vue.http.options.withCredentials=true;
//7.创建日期类型过滤器
//val:原先日期对象
Vue.filter("datatimeFilter",function(val){
    var data=new Date(val)
    var y=data.getFullYear();
    var m=data.getMonth()+1 ;
    var d=data.getDate();
    var h=data.getHours(); 
    var mi=data.getMinutes();
    var s=data.getSeconds();
    m<10&&(m="0"+m);
    d<10&&(d="0"+d);
    return `${y}-${m}-${d} ${h}:${mi}:${s}`;
})
//设置请求服务器根目录

//将提交数据进行转码操作


//7.创建一个日期类型的过滤器

  //7.1:创建日期对象

  //7.4:拼接字符串返回
 

new Vue({
  router,
  render: h => h(App),
  store          //将Vuex对象注册 Vue实例
}).$mount('#app')
