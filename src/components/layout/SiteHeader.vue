<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'

const route = useRoute()
const router = useRouter()
const scrolled = ref(false)
const mobileOpen = ref(false)

const navLinks = [
  { label: 'Showcase', path: '/showcase' },
  { label: 'Life', path: '/life' },
  { label: 'Gallery', path: '/gallery' },
  { label: 'Projects', path: '/projects' },
  { label: 'Events', path: '/events' },
]

const handleScroll = () => {
  scrolled.value = window.scrollY > 60
}

onMounted(() => window.addEventListener('scroll', handleScroll))
onUnmounted(() => window.removeEventListener('scroll', handleScroll))

const navigate = (path: string) => {
  router.push(path)
  mobileOpen.value = false
}
</script>

<template>
  <header :class="['site-header', { 'is-scrolled': scrolled }]">
    <div class="header-inner section-container">
      <RouterLink to="/" class="header-logo">
        <span class="logo-bracket">[</span>
        <span class="logo-name">JEDNAZ</span>
        <span class="logo-bracket">]</span>
      </RouterLink>

      <nav class="header-nav desktop-nav">
        <RouterLink
          v-for="link in navLinks"
          :key="link.path"
          :to="link.path"
          class="nav-link"
        >
          {{ link.label }}
        </RouterLink>
      </nav>

      <button class="hamburger" @click="mobileOpen = !mobileOpen" :aria-expanded="mobileOpen">
        <span :class="['bar', { open: mobileOpen }]" />
        <span :class="['bar', { open: mobileOpen }]" />
        <span :class="['bar', { open: mobileOpen }]" />
      </button>
    </div>

    <!-- Mobile nav -->
    <Transition name="mobile-nav">
      <div v-if="mobileOpen" class="mobile-nav">
        <a
          v-for="link in navLinks"
          :key="link.path"
          class="mobile-nav-link"
          @click="navigate(link.path)"
        >
          {{ link.label }}
        </a>
      </div>
    </Transition>
  </header>
</template>

<style scoped>
.site-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  transition: all var(--transition-normal);
  padding: 20px 0;
}

.site-header.is-scrolled {
  background: rgba(9, 0, 64, 0.85);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-bottom: 1px solid var(--border-subtle);
  padding: 14px 0;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3);
}

.header-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.header-logo {
  font-family: var(--font-display);
  font-size: var(--fs-xl);
  font-weight: 800;
  letter-spacing: 0.05em;
  color: var(--text-primary);
  transition: all var(--transition-fast);
  text-decoration: none;
}

.logo-bracket {
  color: var(--accent-primary);
}

.logo-name {
  background: var(--accent-gradient-primary);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.header-logo:hover {
  filter: brightness(1.2);
}

.header-nav {
  display: flex;
  align-items: center;
  gap: var(--space-sm);
}

.nav-link {
  font-family: var(--font-display);
  font-size: var(--fs-sm);
  font-weight: 600;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-secondary);
  padding: 8px 16px;
  border-radius: var(--radius-full);
  border: 1px solid transparent;
  transition: all var(--transition-fast);
  text-decoration: none;
}

.nav-link:hover,
.nav-link.router-link-active {
  color: var(--text-primary);
  border-color: var(--border-strong);
  background: var(--accent-primary-soft);
  box-shadow: var(--hover-glow);
}

.hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  border: none;
  cursor: pointer;
  padding: 8px;
}

.bar {
  width: 24px;
  height: 2px;
  background: var(--text-primary);
  border-radius: 2px;
  transition: all var(--transition-fast);
}

.mobile-nav {
  display: flex;
  flex-direction: column;
  background: rgba(9, 0, 64, 0.95);
  backdrop-filter: blur(20px);
  border-top: 1px solid var(--border-subtle);
  padding: var(--space-lg);
  gap: var(--space-xs);
}

.mobile-nav-link {
  font-family: var(--font-display);
  font-size: var(--fs-lg);
  font-weight: 700;
  color: var(--text-secondary);
  padding: 12px var(--space-md);
  border-radius: var(--radius-md);
  cursor: pointer;
  transition: all var(--transition-fast);
  letter-spacing: 0.05em;
}

.mobile-nav-link:hover {
  color: var(--text-primary);
  background: var(--accent-primary-soft);
}

.mobile-nav-enter-active,
.mobile-nav-leave-active {
  transition: all var(--transition-normal);
  overflow: hidden;
}
.mobile-nav-enter-from,
.mobile-nav-leave-to {
  opacity: 0;
  max-height: 0;
}
.mobile-nav-enter-to,
.mobile-nav-leave-from {
  opacity: 1;
  max-height: 400px;
}

@media (max-width: 768px) {
  .desktop-nav {
    display: none;
  }
  .hamburger {
    display: flex;
  }
}
</style>
