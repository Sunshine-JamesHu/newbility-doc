<style scoped>
.ipc-box {
  text-align: center;
  width: 100%;
  font-size: 18px;
}
.ipc-box a {
  color: #000;
  text-decoration: none;
}
</style>

<template>
  <div class="ipc-box">
    <a :href="`https://beian.miit.gov.cn/#/Integrated/recordQuery?code=${icp}`" target="_blank">
      备案号:&nbsp&nbsp{{ icp }}
    </a>
  </div>
</template>

<script lang="ts">
export default {
  computed: {
    icp: () => {
      return '皖ICP备2024060952号-1'
    }
  },
  data: () => {
    return {}
  }
}
</script>
