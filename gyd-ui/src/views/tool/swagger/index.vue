<!--<template>-->
<!--  <i-frame :src="url" />-->
<!--</template>-->
<!--<script>-->
<!--import iFrame from "@/components/iFrame/index";-->
<!--export default {-->
<!--  name: "Swagger",-->
<!--  components: { iFrame },-->
<!--  data() {-->
<!--    return {-->
<!--      url: process.env.VUE_APP_BASE_API + "/swagger-ui/index.html"-->
<!--    };-->
<!--  },-->
<!--};-->
<!--</script>-->




<template>
  <div v-loading="loading" :style="'height:'+ height">
    <iframe :src="src" frameborder="no" style="width: 100%;height: 100%" scrolling="auto" />
  </div>
</template>
<script>
export default {
  name: "Swagger",
  data() {
    return {
      src: process.env.VUE_APP_BASE_API + "/doc.html",
      height: document.documentElement.clientHeight - 94.5 + "px;",
      loading: true
    };
  },
  mounted: function() {
    setTimeout(() => {
      this.loading = false;
    }, 230);
    const that = this;
    window.onresize = function temp() {
      that.height = document.documentElement.clientHeight - 94.5 + "px;";
    };
  }
};
</script>
