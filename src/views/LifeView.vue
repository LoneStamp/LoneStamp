<script setup lang="ts">
import { lifeData, profile } from '@/data/mockup'
</script>

<template>
  <div class="life-page">
    <div class="section-container" style="padding-top: 100px; padding-bottom: var(--space-3xl);">
      <p class="section-label">Life</p>
      <h1 class="life-title">{{ profile.name }}</h1>
      <p class="life-subtitle">Developer · Security Engineer · Founder</p>

      <div class="life-layout">
        <!-- Main content -->
        <article class="life-content">
          <p class="life-intro">
            <strong>Jednaz Lonestamp</strong> (publicly known as <strong>JEDNAZ</strong>) is a Filipino fullstack developer, cybersecurity engineer, and entrepreneur based in the Philippines. He is the founder and CEO of <strong>BlackBlazent</strong> and the creator of <strong>BlackVideo</strong>.
          </p>

          <div class="life-section">
            <h2 class="life-h2">Summary</h2>
            <div class="life-divider" />
            <p v-for="para in lifeData.summary.split('\n\n')" :key="para" class="life-para">
              {{ para }}
            </p>
          </div>

          <div class="life-section">
            <h2 class="life-h2">Early Life</h2>
            <div class="life-divider" />
            <p v-for="para in lifeData.earlyLife.split('\n\n')" :key="para" class="life-para">
              {{ para }}
            </p>
          </div>

          <div class="life-section">
            <h2 class="life-h2">Career</h2>
            <div class="life-divider" />
            <p v-for="para in lifeData.career.split('\n\n')" :key="para" class="life-para">
              {{ para }}
            </p>
          </div>

          <div class="life-section">
            <h2 class="life-h2">Development Philosophy</h2>
            <div class="life-divider" />
            <p class="life-para">
              Lonestamp's engineering philosophy is built on six core axioms that govern every system he builds: security as a first-class citizen, clean architecture over clever hacks, simplicity as a reliability multiplier, performance as user experience, disciplined execution over sporadic brilliance, and the synergy of creativity with technical rigor.
            </p>
            <p class="life-para">
              His approach to software is heavily influenced by UNIX design principles, the writing of Robert C. Martin on clean code, and his practical experience in cybersecurity — where the cost of shortcuts is made viscerally clear.
            </p>
          </div>
        </article>

        <!-- Sidebar infobox -->
        <aside class="life-sidebar">
          <div class="infobox glass-card">
            <div class="infobox-header">
              <img :src="profile.avatar" :alt="profile.name" class="infobox-avatar" />
              <div class="infobox-name">{{ profile.name }}</div>
              <div class="infobox-alias">{{ profile.alias }}</div>
            </div>

            <div class="infobox-body">
              <div class="info-row" v-for="item in [
                { label: 'Born', value: lifeData.born },
                { label: 'Birthplace', value: lifeData.birthplace },
                { label: 'Nationality', value: lifeData.nationality },
                { label: 'Nickname', value: lifeData.nickname },
                { label: 'Education', value: lifeData.education },
                { label: 'Occupation', value: lifeData.occupation },
                { label: 'Organization', value: lifeData.organization },
                { label: 'Active', value: lifeData.years_active },
                { label: 'Known For', value: lifeData.known_for },
              ]" :key="item.label">
                <span class="info-label">{{ item.label }}</span>
                <span class="info-value">{{ item.value }}</span>
              </div>
            </div>

            <div class="infobox-footer">
              <div class="infobox-socials">
                <a :href="profile.socials.github" target="_blank" class="social-link">GitHub</a>
                <a :href="profile.socials.linkedin" target="_blank" class="social-link">LinkedIn</a>
                <a :href="profile.socials.youtube" target="_blank" class="social-link">YouTube</a>
              </div>
            </div>
          </div>

          <div class="sidebar-quote glass-card">
            <p class="quote-text">"Security is foundational, not optional."</p>
            <p class="quote-attr">— Jednaz Lonestamp</p>
          </div>
        </aside>
      </div>
    </div>
  </div>
</template>

<style scoped>
.life-page {
  min-height: 100vh;
}

.life-title {
  font-family: var(--font-display);
  font-size: var(--fs-5xl);
  font-weight: 800;
  margin-bottom: var(--space-sm);
  line-height: 1.1;
}

.life-subtitle {
  font-family: var(--font-mono);
  font-size: var(--fs-sm);
  color: var(--text-muted);
  letter-spacing: 0.1em;
  margin-bottom: var(--space-2xl);
}

.life-layout {
  display: grid;
  grid-template-columns: 1fr 320px;
  gap: var(--space-3xl);
  align-items: start;
}

/* Article */
.life-content {
  max-width: 100%;
}

.life-intro {
  font-size: var(--fs-lg);
  color: var(--text-primary);
  line-height: 1.7;
  background: var(--accent-primary-soft);
  border-left: 3px solid var(--accent-primary);
  padding: var(--space-lg);
  border-radius: 0 var(--radius-md) var(--radius-md) 0;
  margin-bottom: var(--space-2xl);
}

.life-intro strong {
  color: var(--accent-primary-hover);
}

.life-section {
  margin-bottom: var(--space-2xl);
}

.life-h2 {
  font-family: var(--font-display);
  font-size: var(--fs-2xl);
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: var(--space-sm);
}

.life-divider {
  height: 1px;
  background: linear-gradient(90deg, var(--accent-primary), transparent);
  margin-bottom: var(--space-lg);
}

.life-para {
  font-size: var(--fs-base);
  color: var(--text-secondary);
  line-height: 1.8;
  margin-bottom: var(--space-md);
}

/* Sidebar / Infobox */
.life-sidebar {
  position: sticky;
  top: 100px;
  display: flex;
  flex-direction: column;
  gap: var(--space-xl);
}

.infobox {
  overflow: hidden;
}

.infobox-header {
  text-align: center;
  padding: var(--space-xl);
  background: linear-gradient(135deg, rgba(177, 59, 255, 0.1), rgba(9, 0, 64, 0.3));
  border-bottom: 1px solid var(--border-subtle);
}

.infobox-avatar {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  object-fit: cover;
  margin: 0 auto var(--space-md);
  border: 3px solid var(--accent-primary);
}

.infobox-name {
  font-family: var(--font-display);
  font-size: var(--fs-lg);
  font-weight: 700;
  color: var(--text-primary);
}

.infobox-alias {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--accent-primary);
  letter-spacing: 0.2em;
  text-transform: uppercase;
  margin-top: 2px;
}

.infobox-body {
  padding: var(--space-md);
}

.info-row {
  display: grid;
  grid-template-columns: 90px 1fr;
  gap: var(--space-sm);
  padding: 8px 0;
  border-bottom: 1px solid var(--divider-color);
  align-items: start;
}

.info-row:last-child {
  border-bottom: none;
}

.info-label {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  padding-top: 2px;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.info-value {
  font-size: var(--fs-sm);
  color: var(--text-secondary);
  line-height: 1.5;
}

.infobox-footer {
  padding: var(--space-md);
  border-top: 1px solid var(--border-subtle);
}

.infobox-socials {
  display: flex;
  gap: var(--space-sm);
  justify-content: center;
  flex-wrap: wrap;
}

.social-link {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--accent-primary);
  border: 1px solid var(--border-subtle);
  padding: 4px 12px;
  border-radius: var(--radius-full);
  transition: all var(--transition-fast);
  text-decoration: none;
}

.social-link:hover {
  background: var(--accent-primary-soft);
  border-color: var(--accent-primary);
}

.sidebar-quote {
  padding: var(--space-xl);
  border-left: 3px solid var(--accent-gold);
}

.quote-text {
  font-family: var(--font-display);
  font-size: var(--fs-base);
  font-style: italic;
  color: var(--text-primary);
  line-height: 1.5;
  margin-bottom: var(--space-sm);
}

.quote-attr {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--accent-gold);
}

@media (max-width: 900px) {
  .life-layout {
    grid-template-columns: 1fr;
  }
  .life-sidebar {
    position: static;
    order: -1;
  }
}
</style>
