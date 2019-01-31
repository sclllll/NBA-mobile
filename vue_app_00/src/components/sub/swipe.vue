<template>
    <div class="app-swipe">
        <mt-swipe :auto="3000">
            <mt-swipe-item v-for="item in list" :key="item.id">
                <img :src="item.img_url">
            </mt-swipe-item>
        </mt-swipe>
    </div>
</template>
<script>
    export default {
        created() {
            
        },
        data(){
            return {

            }
        },
        props:["list"],
        methods:{}
    }
</script>
<style>
   .app-swipe .mint-swipe{height:150px}
    .app-swipe .mint-swipe img{width:100%}
</style>