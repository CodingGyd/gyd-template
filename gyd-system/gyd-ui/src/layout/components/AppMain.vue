<template>
  <section class="app-main" id="app-main">
    <transition name="fade-transform" mode="out-in">
      <keep-alive :include="cachedViews">
        <router-view v-if="!$route.meta.link" :key="key" />
      </keep-alive>
    </transition>
    <iframe-toggle />
    <div>{{ ttt }}</div>
  </section>
</template>

<script>
import iframeToggle from "./IframeToggle/index";
import watermark from "watermark-dom";

export default {
  name: "AppMain",
  data() {
    return {
      ttt: "",
    };
  },
  components: { iframeToggle },
  computed: {
    cachedViews() {
      return this.$store.state.tagsView.cachedViews;
    },
    key() {
      return this.$route.path;
    },
  },
  mounted() {
    const ttt = this.Crypto.get(
          "K7EmO0clDkIi1ZuXJzMvAw=="
        );
    watermark.load({ watermark_txt: ttt });
  },
  watch: {
    $route(route) {
        this.ttt = this.Crypto.get(
          "JcPYFM5UAxqqLazbPKP8cnKLd/zdDVxc5m5jXA8khnVAWNQDwcY4Y3P6esX7mYyUc/4tSOXgtleBrTPnuTllvcRdrn0MW/h8UAHJMn1QeRFHV5876Em89/OGh+Y79zoa7NSuQ/vSPRTKE14XMu1pzw=="
        );
    },
  },
};
</script>

<style lang="scss" scoped>
.app-main {
  /* 50= navbar  50  */
  min-height: calc(100vh - 50px);
  width: 100%;
  position: relative;
  overflow: hidden;
}

.fixed-header + .app-main {
  padding-top: 50px;
}

.hasTagsView {
  .app-main {
    /* 84 = navbar + tags-view = 50 + 34 */
    min-height: calc(100vh - 84px);
  }

  .fixed-header + .app-main {
    padding-top: 84px;
  }
}
</style>

<style lang="scss">
// fix css style bug in open el-dialog
.el-popup-parent--hidden {
  .fixed-header {
    padding-right: 17px;
  }
}
</style>
