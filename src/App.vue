<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import DefaultLayout from './components/layout/DefaultLayout.vue'
import VisitorCounter from './components/shared/VisitorCounter.vue'
</script>

<template>
  <div class="noise-overlay" />
  <DefaultLayout>
    <router-view v-slot="{ Component }">
      <transition name="page" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
  </DefaultLayout>
  <VisitorCounter />
</template>

<style>
.page-enter-active,
.page-leave-active {
  transition: opacity 0.35s ease, transform 0.35s ease;
}
.page-enter-from {
  opacity: 0;
  transform: translateY(16px);
}
.page-leave-to {
  opacity: 0;
  transform: translateY(-8px);
}
</style>
