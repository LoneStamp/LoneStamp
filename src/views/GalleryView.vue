<script setup lang="ts">
import { ref } from 'vue'
import { galleryImages } from '@/data/mockup'

const selectedImage = ref<typeof galleryImages[0] | null>(null)

const openImage = (img: typeof galleryImages[0]) => {
  selectedImage.value = img
  document.body.style.overflow = 'hidden'
}

const closeImage = () => {
  selectedImage.value = null
  document.body.style.overflow = ''
}
</script>

<template>
  <div class="gallery-page">
    <div class="section-container" style="padding-top: 100px; padding-bottom: var(--space-3xl);">
      <p class="section-label">Gallery</p>
      <h1 class="section-title">Life Through<br /><span class="gradient-text">Frames.</span></h1>
      <p class="gallery-sub">Daily life, adventures, and captured moments.</p>

      <!-- Pinterest-style grid -->
      <div class="masonry-grid">
        <div
          v-for="img in galleryImages"
          :key="img.id"
          class="masonry-item"
          @click="openImage(img)"
        >
          <img :src="img.src" :alt="img.title" class="masonry-img" loading="lazy" />
          <div class="masonry-overlay">
            <p class="masonry-title">{{ img.title }}</p>
            <p class="masonry-desc">{{ img.description }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Lightbox overlay -->
    <Transition name="lightbox">
      <div v-if="selectedImage" class="lightbox" @click.self="closeImage">
        <button class="lightbox-close" @click="closeImage">✕</button>
        <div class="lightbox-content">
          <div class="lightbox-image-wrap">
            <img :src="selectedImage.src" :alt="selectedImage.title" class="lightbox-img" />
          </div>
          <div class="lightbox-info glass-card">
            <h3 class="lightbox-title">{{ selectedImage.title }}</h3>
            <p class="lightbox-desc">{{ selectedImage.description }}</p>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<style scoped>
.gallery-page {
  min-height: 100vh;
}

.gallery-sub {
  color: var(--text-muted);
  font-size: var(--fs-lg);
  margin-bottom: var(--space-2xl);
  font-family: var(--font-mono);
}

/* Masonry using CSS columns */
.masonry-grid {
  columns: 4;
  column-gap: var(--space-sm);
}

.masonry-item {
  break-inside: avoid;
  margin-bottom: var(--space-sm);
  border-radius: var(--radius-md);
  overflow: hidden;
  position: relative;
  cursor: pointer;
  border: 1px solid var(--border-subtle);
  transition: all var(--transition-normal);
}

.masonry-item:hover {
  border-color: var(--accent-primary);
  box-shadow: var(--hover-glow);
  transform: scale(1.01);
  z-index: 2;
}

.masonry-img {
  width: 100%;
  display: block;
  transition: transform 0.4s ease;
}

.masonry-item:hover .masonry-img {
  transform: scale(1.04);
}

.masonry-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(180deg, rgba(9,0,64,0.7) 0%, transparent 30%, transparent 60%, rgba(9,0,64,0.9) 100%);
  opacity: 0;
  transition: opacity var(--transition-normal);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: var(--space-md);
}

.masonry-item:hover .masonry-overlay {
  opacity: 1;
}

.masonry-title {
  font-family: var(--font-display);
  font-size: var(--fs-sm);
  font-weight: 700;
  color: var(--text-primary);
}

.masonry-desc {
  font-size: var(--fs-xs);
  color: var(--text-secondary);
  font-family: var(--font-mono);
  line-height: 1.4;
}

/* Lightbox */
.lightbox {
  position: fixed;
  inset: 0;
  background: rgba(9, 0, 64, 0.95);
  backdrop-filter: blur(20px);
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: var(--space-xl);
}

.lightbox-close {
  position: absolute;
  top: var(--space-xl);
  right: var(--space-xl);
  width: 44px;
  height: 44px;
  background: var(--glass-bg);
  border: 1px solid var(--border-strong);
  color: var(--text-primary);
  border-radius: 50%;
  font-size: var(--fs-lg);
  cursor: pointer;
  transition: all var(--transition-fast);
  display: flex;
  align-items: center;
  justify-content: center;
}

.lightbox-close:hover {
  background: var(--accent-primary);
  border-color: var(--accent-primary);
}

.lightbox-content {
  max-width: 900px;
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: var(--space-lg);
}

.lightbox-image-wrap {
  border-radius: var(--radius-lg);
  overflow: hidden;
  max-height: 70vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.lightbox-img {
  max-width: 100%;
  max-height: 70vh;
  object-fit: contain;
  border-radius: var(--radius-lg);
}

.lightbox-info {
  padding: var(--space-lg);
}

.lightbox-title {
  font-family: var(--font-display);
  font-size: var(--fs-xl);
  font-weight: 700;
  margin-bottom: var(--space-sm);
}

.lightbox-desc {
  color: var(--text-secondary);
  font-size: var(--fs-base);
}

.lightbox-enter-active,
.lightbox-leave-active {
  transition: all var(--transition-normal);
}
.lightbox-enter-from,
.lightbox-leave-to {
  opacity: 0;
}

@media (max-width: 900px) {
  .masonry-grid {
    columns: 2;
  }
}

@media (max-width: 500px) {
  .masonry-grid {
    columns: 1;
  }
}
</style>
