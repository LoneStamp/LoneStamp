<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { profile, showcaseImages } from '@/data/mockup'

const router = useRouter()
const heroReady = ref(false)
const parallaxOffset = ref(0)

const navLinks = [
  { label: 'Showcase', path: '/showcase' },
  { label: 'Life', path: '/life' },
  { label: 'Gallery', path: '/gallery' },
  { path: '/projects', label: 'Projects' },
  { path: '/events', label: 'Events' },
]

onMounted(() => {
  setTimeout(() => heroReady.value = true, 100)
  window.addEventListener('scroll', () => {
    parallaxOffset.value = window.scrollY * 0.5
  })
})
</script>

<template>
  <div class="home-page">
    <!-- HERO -->
    <section class="hero-section">
      <!-- Parallax bg -->
      <div
        class="hero-bg"
        :style="{ transform: `translateY(${parallaxOffset}px)` }"
      >
        <img
          :src="profile.coverPhoto"
          alt="Cover photo"
          class="hero-bg-img"
        />
        <div class="hero-bg-overlay" />
      </div>

      <!-- Profile card -->
      <div :class="['hero-content', { ready: heroReady }]">
        <div class="profile-card glass-card">
          <div class="profile-avatar-wrap">
            <div class="avatar-ring">
              <img :src="profile.avatar" :alt="profile.name" class="avatar-img" />
            </div>
          </div>

          <div class="profile-info">
            <h1 class="profile-name">
              {{ profile.name }}
              <span class="profile-alias">({{ profile.alias }})</span>
            </h1>
            <div class="profile-meta">
              <span class="meta-item">
                <span class="meta-diamond">◇</span>
                {{ profile.age }} Years of Age
              </span>
              <span class="meta-item">
                <span class="meta-diamond">◇</span>
                {{ profile.degree }}
              </span>
              <span class="meta-item">
                <span class="meta-diamond">◇</span>
                {{ profile.country }}
              </span>
            </div>
            <div class="profile-meta">
              <span class="meta-item company">
                <span class="meta-icon">▪</span>
                {{ profile.company }}
              </span>
              <span class="meta-item company">
                <span class="meta-icon">▪</span>
                {{ profile.position }}
              </span>
              <span class="meta-item company">
                <span class="meta-icon">▪</span>
                {{ profile.legacy }}
              </span>
            </div>
            <p class="profile-tagline">{{ profile.tagline }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- NAV PILLS -->
    <nav class="page-nav-pills">
      <div class="section-container">
        <div class="pills-inner">
          <RouterLink
            v-for="link in navLinks"
            :key="link.path"
            :to="link.path"
            class="pill"
          >
            {{ link.label }}
          </RouterLink>
        </div>
      </div>
    </nav>

    <!-- PREVIEW STRIP -->
    <section class="preview-strip section-container">
      <div class="strip-images">
        <div
          v-for="(img, i) in showcaseImages"
          :key="i"
          class="strip-img-wrap"
          :style="{ animationDelay: `${i * 0.1}s` }"
          @click="router.push('/showcase')"
        >
          <img :src="img" :alt="`Preview ${i+1}`" class="strip-img" />
          <div class="strip-img-overlay" />
        </div>
      </div>
    </section>

    <!-- INTRO TEASER -->
    <section class="intro-teaser section section-container">
      <div class="teaser-grid">
        <div class="teaser-text">
          <p class="section-label">Who Is JEDNAZ</p>
          <h2 class="section-title">The Intelligent<br/><span class="gradient-text">Mind & Builder</span></h2>
          <p class="teaser-body">
            A fullstack developer, cybersecurity engineer, and founder operating from the Philippines. I build products that matter — systems architected with discipline, secured by design, and shipped to last.
          </p>
          <RouterLink to="/showcase" class="btn-primary">
            View Showcase →
          </RouterLink>
        </div>
        <div class="teaser-video">
          <div class="video-embed-wrap">
            <iframe
              :src="`https://www.youtube.com/embed/${profile.youtubeEmbedId}`"
              title="Introduction"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
              class="video-embed"
            />
          </div>
        </div>
      </div>
    </section>

    <!-- QUICK SKILLS PREVIEW -->
    <section class="skills-preview section">
      <div class="section-container">
        <p class="section-label">Core Expertise</p>
        <h2 class="section-title">Built to Engineer.<br /><span class="gradient-text-gold">Built to Secure.</span></h2>
        <div class="skill-pills">
          <span v-for="skill in ['Vue.js', 'TypeScript', 'Cybersecurity', 'Convex', 'Vite', 'Pure CSS', 'System Architecture', 'UI/UX Design', 'Security Engineering', 'Fullstack Dev']"
            :key="skill"
            class="skill-chip"
          >
            {{ skill }}
          </span>
        </div>
        <RouterLink to="/showcase" class="btn-ghost" style="margin-top: var(--space-xl)">
          See All Skills
        </RouterLink>
      </div>
    </section>
  </div>
</template>

<style scoped>
.home-page {
  min-height: 100vh;
}

/* HERO */
.hero-section {
  position: relative;
  height: 100vh;
  min-height: 600px;
  display: flex;
  align-items: flex-end;
  overflow: hidden;
}

.hero-bg {
  position: absolute;
  inset: -100px 0 0 0;
  will-change: transform;
}

.hero-bg-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center top;
}

.hero-bg-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    to bottom,
    rgba(9, 0, 64, 0.3) 0%,
    rgba(9, 0, 64, 0.6) 50%,
    rgba(9, 0, 64, 0.95) 100%
  );
}

.hero-content {
  position: relative;
  z-index: 2;
  width: 100%;
  padding: 0 var(--space-xl) var(--space-2xl);
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s ease;
}

.hero-content.ready {
  opacity: 1;
  transform: translateY(0);
}

.profile-card {
  display: flex;
  align-items: center;
  gap: var(--space-xl);
  max-width: 800px;
  padding: var(--space-xl);
}

.profile-avatar-wrap {
  flex-shrink: 0;
}

.avatar-ring {
  width: 110px;
  height: 110px;
  border-radius: 50%;
  padding: 3px;
  background: linear-gradient(135deg, var(--accent-primary), #00EEFF);
  animation: pulseGlow 3s ease infinite;
}

.avatar-img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid var(--bg-primary);
}

.profile-name {
  font-family: var(--font-display);
  font-size: var(--fs-2xl);
  font-weight: 800;
  margin-bottom: var(--space-sm);
  line-height: 1.2;
}

.profile-alias {
  color: var(--text-muted);
  font-weight: 400;
  font-size: var(--fs-lg);
}

.profile-meta {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-md);
  margin-bottom: var(--space-sm);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
}

.meta-item {
  color: var(--text-secondary);
  display: flex;
  align-items: center;
  gap: 4px;
}

.meta-diamond {
  color: var(--accent-primary);
}

.meta-icon {
  color: var(--accent-gold);
}

.meta-item.company {
  color: var(--text-muted);
}

.profile-tagline {
  margin-top: var(--space-sm);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  letter-spacing: 0.15em;
  text-transform: uppercase;
  text-align: left;
}

/* NAV PILLS */
.page-nav-pills {
  background: rgba(9, 0, 64, 0.9);
  border-top: 1px solid var(--border-subtle);
  border-bottom: 1px solid var(--border-subtle);
  backdrop-filter: blur(10px);
  position: sticky;
  top: 64px;
  z-index: 10;
}

.pills-inner {
  display: flex;
  gap: 2px;
  padding: var(--space-sm) 0;
  overflow-x: auto;
}

.pill {
  font-family: var(--font-display);
  font-size: var(--fs-sm);
  font-weight: 700;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-secondary);
  padding: 10px 24px;
  border-radius: 6px;
  background: rgba(255,255,255,0.04);
  border: 1px solid transparent;
  cursor: pointer;
  transition: all var(--transition-fast);
  white-space: nowrap;
  text-decoration: none;
}

.pill:hover,
.pill.router-link-active {
  background: var(--accent-primary-soft);
  color: var(--text-primary);
  border-color: var(--border-subtle);
}

/* PREVIEW STRIP */
.preview-strip {
  padding: var(--space-2xl) var(--space-xl);
}

.strip-images {
  display: flex;
  gap: var(--space-sm);
  overflow-x: auto;
  padding-bottom: var(--space-sm);
}

.strip-img-wrap {
  flex: 0 0 180px;
  height: 160px;
  border-radius: var(--radius-md);
  overflow: hidden;
  position: relative;
  cursor: pointer;
  animation: fadeInUp 0.6s ease forwards;
  opacity: 0;
  border: 1px solid var(--border-subtle);
  transition: all var(--transition-normal);
}

.strip-img-wrap:hover {
  transform: translateY(-4px) scale(1.02);
  border-color: var(--accent-primary);
  box-shadow: var(--hover-glow);
}

.strip-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.strip-img-wrap:hover .strip-img {
  transform: scale(1.08);
}

.strip-img-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(180deg, transparent 40%, rgba(9,0,64,0.6) 100%);
}

/* INTRO TEASER */
.teaser-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-3xl);
  align-items: center;
}

.teaser-body {
  color: var(--text-secondary);
  font-size: var(--fs-lg);
  line-height: 1.7;
  margin-bottom: var(--space-xl);
}

.video-embed-wrap {
  position: relative;
  padding-bottom: 56.25%;
  border-radius: var(--radius-lg);
  overflow: hidden;
  border: 1px solid var(--border-subtle);
  box-shadow: var(--glass-shadow-strong);
}

.video-embed {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
}

/* SKILLS PREVIEW */
.skills-preview {
  background: linear-gradient(135deg, rgba(14, 0, 90, 0.4), rgba(9, 0, 64, 0.2));
  border-top: 1px solid var(--border-subtle);
  border-bottom: 1px solid var(--border-subtle);
}

.skill-pills {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-sm);
  margin-top: var(--space-xl);
}

.skill-chip {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  padding: 8px 16px;
  border: 1px solid var(--border-subtle);
  border-radius: var(--radius-full);
  color: var(--text-secondary);
  background: var(--accent-primary-soft);
  letter-spacing: 0.05em;
  transition: all var(--transition-fast);
  cursor: default;
}

.skill-chip:hover {
  border-color: var(--accent-primary);
  color: var(--text-primary);
  box-shadow: var(--hover-glow);
}

@media (max-width: 768px) {
  .profile-card {
    flex-direction: column;
    text-align: center;
    padding: var(--space-lg);
  }
  .profile-meta {
    justify-content: center;
  }
  .teaser-grid {
    grid-template-columns: 1fr;
    gap: var(--space-xl);
  }
  .hero-content {
    padding: 0 var(--space-lg) var(--space-xl);
  }
}
</style>
