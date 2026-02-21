<script setup lang="ts">
import { projects } from '@/data/mockup'
</script>

<template>
  <div class="projects-page">
    <div class="section-container" style="padding-top: 100px; padding-bottom: var(--space-3xl);">
      <p class="section-label">Projects</p>
      <h1 class="section-title">Things I've<br /><span class="gradient-text">Shipped.</span></h1>
      <p class="projects-sub">Production systems. Real engineering. Built to last.</p>

      <div class="projects-list">
        <article
          v-for="project in projects"
          :key="project.id"
          class="project-card glass-card"
        >
          <!-- Cover: YouTube embed or image -->
          <div class="project-cover">
            <template v-if="project.youtubeId">
              <iframe
                :src="`https://www.youtube.com/embed/${project.youtubeId}`"
                :title="project.title"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
                class="project-video"
              />
            </template>
            <template v-else>
              <img :src="project.coverImage" :alt="project.title" class="project-cover-img" />
              <div class="project-cover-overlay" />
            </template>

            <span :class="['project-status', project.status === 'Live' ? 'live' : 'wip']">
              {{ project.status }}
            </span>
          </div>

          <!-- Project info -->
          <div class="project-body">
            <div class="project-main">
              <h2 class="project-title">{{ project.title }}</h2>
              <p class="project-short">{{ project.shortDesc }}</p>
              <p class="project-desc">{{ project.description }}</p>

              <div class="project-stack">
                <span v-for="tech in project.stack" :key="tech" class="skill-tag">{{ tech }}</span>
              </div>
            </div>

            <footer class="project-footer">
              <div class="project-meta">
                <span class="meta-field">
                  <span class="meta-key">Created</span>
                  <span class="meta-val">{{ project.dateCreated }}</span>
                </span>
                <span class="meta-field">
                  <span class="meta-key">Published</span>
                  <span class="meta-val">{{ project.published }}</span>
                </span>
              </div>

              <div class="project-links">
                <a :href="project.github" target="_blank" class="project-link github">
                  <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                    <path d="M12 2C6.477 2 2 6.477 2 12c0 4.42 2.865 8.17 6.839 9.49.5.092.682-.217.682-.482 0-.237-.008-.866-.013-1.7-2.782.604-3.369-1.34-3.369-1.34-.454-1.156-1.11-1.464-1.11-1.464-.908-.62.069-.608.069-.608 1.003.07 1.531 1.03 1.531 1.03.892 1.529 2.341 1.087 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.11-4.555-4.943 0-1.091.39-1.984 1.029-2.683-.103-.253-.446-1.27.098-2.647 0 0 .84-.269 2.75 1.025A9.578 9.578 0 0112 6.836c.85.004 1.705.115 2.504.337 1.909-1.294 2.747-1.025 2.747-1.025.546 1.377.203 2.394.1 2.647.64.699 1.028 1.592 1.028 2.683 0 3.842-2.339 4.687-4.566 4.935.359.309.678.919.678 1.852 0 1.336-.012 2.415-.012 2.743 0 .267.18.578.688.48C19.138 20.167 22 16.418 22 12c0-5.523-4.477-10-10-10z"/>
                  </svg>
                  GitHub
                </a>
                <a v-if="project.website" :href="project.website" target="_blank" class="project-link website">
                  <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 014 10 15.3 15.3 0 01-4 10 15.3 15.3 0 01-4-10 15.3 15.3 0 014-10z"/>
                  </svg>
                  Visit Site
                </a>
              </div>
            </footer>
          </div>
        </article>
      </div>
    </div>
  </div>
</template>

<style scoped>
.projects-page {
  min-height: 100vh;
}

.projects-sub {
  color: var(--text-muted);
  font-size: var(--fs-lg);
  margin-bottom: var(--space-2xl);
  font-family: var(--font-mono);
}

.projects-list {
  display: flex;
  flex-direction: column;
  gap: var(--space-2xl);
}

.project-card {
  overflow: hidden;
  transition: all var(--transition-normal);
}

.project-card:hover {
  box-shadow: var(--glass-shadow-strong);
  transform: translateY(-4px);
}

.project-cover {
  position: relative;
  height: 380px;
  background: var(--bg-secondary);
}

.project-video {
  width: 100%;
  height: 100%;
  border: none;
}

.project-cover-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.project-cover-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(180deg, transparent 60%, rgba(9,0,64,0.6) 100%);
}

.project-status {
  position: absolute;
  top: var(--space-lg);
  right: var(--space-lg);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  font-weight: 700;
  padding: 4px 14px;
  border-radius: var(--radius-full);
}

.project-status.live {
  background: rgba(0, 200, 83, 0.2);
  border: 1px solid #00C853;
  color: #00C853;
}

.project-status.wip {
  background: rgba(255, 204, 0, 0.15);
  border: 1px solid var(--accent-gold);
  color: var(--accent-gold);
}

.project-body {
  padding: var(--space-2xl);
  display: flex;
  flex-direction: column;
  gap: var(--space-xl);
}

.project-title {
  font-family: var(--font-display);
  font-size: var(--fs-3xl);
  font-weight: 800;
  margin-bottom: var(--space-sm);
}

.project-short {
  font-family: var(--font-mono);
  font-size: var(--fs-sm);
  color: var(--accent-primary);
  margin-bottom: var(--space-md);
}

.project-desc {
  font-size: var(--fs-base);
  color: var(--text-secondary);
  line-height: 1.7;
  margin-bottom: var(--space-lg);
}

.project-stack {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-xs);
}

.skill-tag {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  padding: 4px 12px;
  border: 1px solid var(--border-subtle);
  border-radius: var(--radius-full);
  color: var(--text-muted);
  background: var(--accent-primary-soft);
}

.project-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-top: var(--space-lg);
  border-top: 1px solid var(--divider-color);
  flex-wrap: wrap;
  gap: var(--space-md);
}

.project-meta {
  display: flex;
  gap: var(--space-xl);
}

.meta-field {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.meta-key {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.1em;
}

.meta-val {
  font-size: var(--fs-sm);
  font-weight: 600;
  color: var(--text-primary);
}

.project-links {
  display: flex;
  gap: var(--space-sm);
}

.project-link {
  display: inline-flex;
  align-items: center;
  gap: var(--space-xs);
  padding: 8px 20px;
  border-radius: var(--radius-full);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  font-weight: 700;
  transition: all var(--transition-fast);
  text-decoration: none;
  letter-spacing: 0.05em;
}

.project-link.github {
  background: var(--glass-bg);
  border: 1px solid var(--border-subtle);
  color: var(--text-secondary);
}

.project-link.github:hover {
  border-color: var(--accent-primary);
  color: var(--accent-primary);
  box-shadow: var(--hover-glow);
}

.project-link.website {
  background: var(--accent-gradient-primary);
  border: none;
  color: white;
  box-shadow: 0 0 20px rgba(177, 59, 255, 0.4);
}

.project-link.website:hover {
  box-shadow: 0 0 35px rgba(177, 59, 255, 0.7);
  transform: translateY(-1px);
}
</style>
