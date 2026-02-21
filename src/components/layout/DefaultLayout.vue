<script setup lang="ts">
import SiteHeader from './SiteHeader.vue'
import SiteFooter from './SiteFooter.vue'
</script>

<template>
  <div class="layout-wrapper">
    <SiteHeader />
    <main class="layout-main">
      <slot />
    </main>
    <SiteFooter />
  </div>
</template>

<style scoped>
.layout-wrapper {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: var(--bg-primary);
  position: relative;
}

.layout-wrapper::before {
  content: '';
  position: fixed;
  inset: 0;
  background:
    radial-gradient(ellipse at 10% 10%, rgba(177, 59, 255, 0.12) 0%, transparent 50%),
    radial-gradient(ellipse at 90% 80%, rgba(110, 0, 255, 0.08) 0%, transparent 45%),
    radial-gradient(ellipse at 50% 50%, rgba(9, 0, 64, 0.5) 0%, transparent 70%);
  pointer-events: none;
  z-index: 0;
}

.layout-main {
  flex: 1;
  position: relative;
  z-index: 1;
}
</style>
