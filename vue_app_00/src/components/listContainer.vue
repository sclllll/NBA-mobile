<template>
    <div class="app-list">
        <h1>显示data中用户列表</h1>
        <ul>
            <li v-for="item in list" :key="item.uid">
                {{item.uid}}{{item.name}}
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                list:[
                    {uid:1,name:"tom",age:15},
                    {uid:2,name:"jerry",age:16},
                    {uid:3,name:"brown",age:17},
                ]
            }
        }
    }
</script>
<style>
    
</style>