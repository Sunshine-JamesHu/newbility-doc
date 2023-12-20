<script setup lang="ts">
import { RouterView } from 'vue-router'
import WebHeader from './components/WebHeader.vue'
</script>

<template>
  <header class="header">
    <WebHeader />
  </header>
  <main class="body">
    <RouterView />
  </main>
</template>

<style scoped>
.logo {
  display: block;
  margin: 0 auto 2rem;
}

.header {
  flex-shrink: 0;
}

.body {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  min-height: calc(100vh - 50px);
  padding-top: 50px;
}
</style>
