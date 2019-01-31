import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Home from './components/tabbar/Home.vue'
import NewsList from './components/news/NewsList'
import NewsInfo from './components/news/NewsInfo'
import GoodsList from './components/good/GoodsList.vue'
import GoodsInfo from './components/good/GoodsInfo.vue'
import Login from './components/login/Login.vue'
import Reg from './components/login/Reg.vue'
import Myself from './components/login/Myself.vue'
import Cart from './components/tabbar/Cart.vue'
import Search from './components/tabbar/Search.vue'
import Show from './components/tabbar/Show.vue'
import Play from './components/tabbar/Play.vue'
import Rank from './components/tabbar/Rank.vue'
import Hupu from './components/tabbar/Hupu.vue'
Vue.use(Router)

export default new Router({
  routes: [
    {path:'/search',component:Search},
    {path:'/',redirect:"/Home"},
    {path:'/Home',component:Home},
    {path:'/newslist',component:NewsList},
    {path:'/newsinfo',component:NewsInfo},
    {path:'/goodslist',component:GoodsList},
    {path:'/goodsinfo/:id',component:GoodsInfo},
    {path:'/login',component:Login},
    {path:'/cart',component:Cart},
    {path:'/show',component:Show},
    {path:'/play',component:Play},
    {path:'/rank',component:Rank},
    {path:'/reg',component:Reg},
    {path:'/hupu',component:Hupu},
    {path:'/myself',component:Myself}
  ]
})
