<script setup lang="ts">
import { ref, onMounted } from 'vue'

const count = ref(0)
const target = 4832

onMounted(() => {
  // Animate counter up
  const duration = 2000
  const steps = 60
  const increment = target / steps
  let current = 0
  const timer = setInterval(() => {
    current += increment
    if (current >= target) {
      count.value = target
      clearInterval(timer)
    } else {
      count.value = Math.floor(current)
    }
  }, duration / steps)
})
</script>

<template>
  <RouterLink to="/" class="visitor-counter" title="Visitor count — powered by geo analytics">
    <div class="counter-eye">
      <svg viewBox="0 0 40 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="eye-svg">
        <path d="M20 4C11 4 4 12 4 12C4 12 11 20 20 20C29 20 36 12 36 12C36 12 29 4 20 4Z" stroke="currentColor" stroke-width="2" fill="none"/>
        <circle cx="20" cy="12" r="4" fill="currentColor"/>
        <circle cx="21" cy="11" r="1.5" fill="rgba(9,0,64,0.8)"/>
      </svg>
    </div>
    <span class="counter-number">{{ count.toLocaleString() }}</span>
    <span class="counter-label">visitors</span>
  </RouterLink>
</template>

<style scoped>
.visitor-counter {
  position: fixed;
  right: -60px;
  top: 50%;
  transform: translateY(-50%) rotate(90deg);
  transform-origin: center;
  display: flex;
  align-items: center;
  gap: 8px;
  background: var(--glass-bg);
  border: 1px solid var(--glass-border);
  backdrop-filter: var(--glass-blur);
  padding: 8px 16px;
  border-radius: var(--radius-full);
  color: var(--text-secondary);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  z-index: 50;
  transition: all var(--transition-normal);
  text-decoration: none;
  cursor: pointer;
  white-space: nowrap;
}

.visitor-counter:hover {
  color: var(--accent-primary);
  border-color: var(--accent-primary);
  box-shadow: var(--hover-glow);
  right: -52px;
}

.counter-eye {
  width: 18px;
  height: 18px;
  color: var(--accent-primary);
}

.eye-svg {
  width: 100%;
  height: 100%;
}

.counter-number {
  color: var(--text-primary);
  font-weight: 700;
}

.counter-label {
  color: var(--text-muted);
}

@media (max-width: 768px) {
  .visitor-counter {
    display: none;
  }
}
</style>
