<script setup lang="ts">
import { ref } from 'vue'
import { profile, showcaseImages, skills, achievements } from '@/data/mockup'

const philosophy = [
  'Security is foundational, not optional.',
  'Clean systems outlast flashy hacks.',
  'Simplicity increases reliability.',
  'Performance is part of user experience.',
  'Discipline drives consistent engineering output.',
  'Creativity enhances technical problem solving.',
]
</script>

<template>
  <div class="showcase-page">

    <!-- 1. HERO -->
    <section class="sc-hero section">
      <div class="section-container">
        <div class="hero-inner">
          <div class="hero-text">
            <p class="section-label">01 — Hero</p>
            <h1 class="hero-headline">
              Engineering the<br />
              <span class="gradient-text">Unbreakable.</span><br />
              Designing the<br />
              <span class="gradient-text-gold">Unforgettable.</span>
            </h1>
            <p class="hero-sub">
              Fullstack developer. Cybersecurity engineer. Founder.<br />
              Built from discipline. Driven by vision.
            </p>
            <div class="hero-actions">
              <RouterLink to="/projects" class="btn-primary">View Projects →</RouterLink>
              <RouterLink to="/life" class="btn-ghost">Read My Story</RouterLink>
            </div>
          </div>
          <div class="hero-images-grid">
            <div
              v-for="(img, i) in showcaseImages"
              :key="i"
              class="hero-grid-img"
              :class="`img-${i}`"
            >
              <img :src="img" :alt="`Showcase ${i+1}`" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 2. IDENTITY SNAPSHOT -->
    <section class="sc-identity section">
      <div class="section-container">
        <p class="section-label">02 — Identity Snapshot</p>
        <div class="identity-grid">
          <div class="identity-card glass-card" v-for="item in [
            { label: 'Name', value: 'Jednaz Lonestamp' },
            { label: 'Alias', value: 'JEDNAZ' },
            { label: 'Age', value: '22' },
            { label: 'Degree', value: 'BS Cybersecurity' },
            { label: 'Country', value: 'Philippines' },
            { label: 'Company', value: 'BlackBlazent' },
            { label: 'Position', value: 'Founder & CEO' },
            { label: 'Legacy', value: 'BlackVideo' },
          ]" :key="item.label">
            <span class="id-label">{{ item.label }}</span>
            <span class="id-value">{{ item.value }}</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 3. FEATURED ACHIEVEMENTS -->
    <section class="sc-achievements section">
      <div class="section-container">
        <p class="section-label">03 — Featured Achievements</p>
        <h2 class="section-title">Proof of<br /><span class="gradient-text">Work.</span></h2>
        <div class="achievements-list">
          <div
            v-for="(a, i) in achievements"
            :key="i"
            class="achievement-item glass-card"
          >
            <div class="achievement-image">
              <img :src="a.image" :alt="a.title" />
              <div class="achievement-year">{{ a.year }}</div>
            </div>
            <div class="achievement-content">
              <h3 class="achievement-title">{{ a.title }}</h3>
              <p class="achievement-desc">{{ a.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 4. CORE EXPERTISE (Skills) -->
    <section class="sc-skills section">
      <div class="section-container">
        <p class="section-label">04 — Core Expertise</p>
        <h2 class="section-title">The <span class="gradient-text">Technical</span><br />Arsenal.</h2>
        <div class="skills-showcase">
          <div
            v-for="(skill, i) in skills"
            :key="i"
            :class="['skill-item', { reverse: i % 2 !== 0 }]"
          >
            <div class="skill-image-window">
              <img :src="skill.image" :alt="skill.category" class="skill-img" />
              <div class="skill-img-reflection" />
              <div class="skill-img-frame" />
            </div>
            <div class="skill-content">
              <span class="skill-icon">{{ skill.icon }}</span>
              <h3 class="skill-category">{{ skill.category }}</h3>
              <p class="skill-desc">{{ skill.description }}</p>
              <div class="skill-tags">
                <span v-for="tag in skill.tags" :key="tag" class="skill-tag">{{ tag }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 5. CREATIVE DIMENSION (Image tile grid) -->
    <section class="sc-creative section">
      <div class="section-container">
        <p class="section-label">05 — Creative Dimension</p>
        <h2 class="section-title">Beyond the<br /><span class="gradient-text">Terminal.</span></h2>
        <div class="creative-tiles">
          <div
            v-for="(img, i) in showcaseImages"
            :key="i"
            class="creative-tile"
            :class="`tile-${i}`"
          >
            <img :src="img" :alt="`Creative ${i+1}`" />
            <div class="tile-overlay" />
          </div>
        </div>
      </div>
    </section>

    <!-- 6. PHILOSOPHY / MINDSET -->
    <section class="sc-philosophy section">
      <div class="section-container">
        <p class="section-label">06 — Philosophy</p>
        <h2 class="section-title">The <span class="gradient-text-gold">Code</span><br />I Live By.</h2>
        <div class="philosophy-list">
          <div
            v-for="(line, i) in philosophy"
            :key="i"
            class="philosophy-line"
          >
            <span class="philo-index">0{{ i+1 }}</span>
            <span class="philo-text">{{ line }}</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 7. FEATURED PROJECT -->
    <section class="sc-featured-project section">
      <div class="section-container">
        <p class="section-label">07 — Featured Project</p>
        <h2 class="section-title">BlackVideo.</h2>
        <div class="featured-project glass-card">
          <div class="fp-image">
            <img src="https://images.unsplash.com/photo-1492619375914-88005aa9e8fb?w=800&h=450&fit=crop" alt="BlackVideo" />
            <div class="fp-badge">Live</div>
          </div>
          <div class="fp-content">
            <p class="fp-subtitle">Full-stack video streaming platform — solo-engineered.</p>
            <p class="fp-desc">Built from infrastructure to UI without a team. Features real-time analytics, custom adaptive video player, secure multi-format upload pipeline, and creator monetization infrastructure.</p>
            <div class="fp-stack">
              <span v-for="tech in ['Vue.js', 'TypeScript', 'Convex', 'Pure CSS']" :key="tech" class="skill-tag">{{ tech }}</span>
            </div>
            <div class="fp-actions">
              <a href="https://github.com/jednaz/blackvideo" target="_blank" class="btn-ghost">GitHub ↗</a>
              <a href="https://blackvideo.app" target="_blank" class="btn-primary">Visit Site →</a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 8. CONTACT / CTA -->
    <section class="sc-cta section">
      <div class="section-container">
        <p class="section-label">08 — Contact</p>
        <div class="cta-inner glass-card">
          <h2 class="cta-title">Let's Build<br /><span class="gradient-text">Something Serious.</span></h2>
          <p class="cta-sub">I'm available for engineering contracts, security audits, and select collaborations.</p>
          <a :href="`mailto:${profile.email}`" class="btn-primary">
            Send Email →
          </a>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.showcase-page {
  padding-top: 80px;
}

/* HERO */
.sc-hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
}

.hero-inner {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-3xl);
  align-items: center;
}

.hero-headline {
  font-family: var(--font-display);
  font-size: var(--fs-5xl);
  font-weight: 800;
  line-height: 1.05;
  margin-bottom: var(--space-xl);
}

.hero-sub {
  font-size: var(--fs-lg);
  color: var(--text-secondary);
  line-height: 1.6;
  margin-bottom: var(--space-xl);
}

.hero-actions {
  display: flex;
  gap: var(--space-md);
  flex-wrap: wrap;
}

.hero-images-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(2, 160px);
  gap: var(--space-sm);
}

.hero-grid-img {
  border-radius: var(--radius-md);
  overflow: hidden;
  border: 1px solid var(--border-subtle);
  transition: all var(--transition-normal);
}

.hero-grid-img:hover {
  border-color: var(--accent-primary);
  box-shadow: var(--hover-glow);
  transform: scale(1.03);
}

.hero-grid-img.img-0 { grid-column: 1 / 3; grid-row: 1; }
.hero-grid-img.img-1 { grid-column: 3; grid-row: 1; }
.hero-grid-img.img-2 { grid-column: 1; grid-row: 2; }
.hero-grid-img.img-3 { grid-column: 2; grid-row: 2; }
.hero-grid-img.img-4 { grid-column: 3; grid-row: 2; }

.hero-grid-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.hero-grid-img:hover img {
  transform: scale(1.1);
}

/* IDENTITY */
.identity-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: var(--space-md);
  margin-top: var(--space-xl);
}

.identity-card {
  padding: var(--space-lg);
  display: flex;
  flex-direction: column;
  gap: 4px;
  transition: all var(--transition-fast);
}

.identity-card:hover {
  border-color: var(--border-strong);
  box-shadow: var(--glass-shadow-strong);
  transform: translateY(-2px);
}

.id-label {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  letter-spacing: 0.15em;
  text-transform: uppercase;
}

.id-value {
  font-family: var(--font-display);
  font-size: var(--fs-lg);
  font-weight: 700;
  color: var(--text-primary);
}

/* ACHIEVEMENTS */
.achievements-list {
  display: flex;
  flex-direction: column;
  gap: var(--space-xl);
  margin-top: var(--space-xl);
}

.achievement-item {
  display: grid;
  grid-template-columns: 380px 1fr;
  gap: var(--space-xl);
  overflow: hidden;
  transition: all var(--transition-normal);
}

.achievement-item:hover {
  box-shadow: var(--glass-shadow-strong);
  transform: translateX(4px);
}

.achievement-image {
  position: relative;
  height: 220px;
}

.achievement-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.achievement-year {
  position: absolute;
  top: var(--space-md);
  left: var(--space-md);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  font-weight: 700;
  background: var(--accent-gradient-primary);
  padding: 4px 12px;
  border-radius: var(--radius-full);
  color: white;
}

.achievement-content {
  padding: var(--space-xl) var(--space-xl) var(--space-xl) 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.achievement-title {
  font-family: var(--font-display);
  font-size: var(--fs-2xl);
  font-weight: 800;
  margin-bottom: var(--space-md);
}

.achievement-desc {
  font-size: var(--fs-lg);
  color: var(--text-secondary);
  line-height: 1.6;
}

/* SKILLS SHOWCASE */
.skills-showcase {
  display: flex;
  flex-direction: column;
  gap: var(--space-3xl);
  margin-top: var(--space-2xl);
}

.skill-item {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-3xl);
  align-items: center;
}

.skill-item.reverse {
  direction: rtl;
}

.skill-item.reverse > * {
  direction: ltr;
}

.skill-image-window {
  position: relative;
  border-radius: var(--radius-lg);
  overflow: hidden;
  aspect-ratio: 4/3;
  border: 1px solid var(--border-subtle);
}

.skill-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s ease;
}

.skill-image-window:hover .skill-img {
  transform: scale(1.05);
}

.skill-img-reflection {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 40%;
  background: linear-gradient(to bottom, transparent, rgba(9, 0, 64, 0.8));
}

.skill-img-frame {
  position: absolute;
  inset: 0;
  border-radius: var(--radius-lg);
  box-shadow: inset 0 0 0 1px rgba(177, 59, 255, 0.2);
}

.skill-icon {
  font-size: 2.5rem;
  margin-bottom: var(--space-md);
  display: block;
}

.skill-category {
  font-family: var(--font-display);
  font-size: var(--fs-2xl);
  font-weight: 800;
  margin-bottom: var(--space-md);
}

.skill-desc {
  color: var(--text-secondary);
  font-size: var(--fs-base);
  line-height: 1.7;
  margin-bottom: var(--space-lg);
}

.skill-tags {
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

/* CREATIVE TILES */
.creative-tiles {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  grid-template-rows: repeat(2, 200px);
  gap: var(--space-sm);
  margin-top: var(--space-xl);
}

.creative-tile {
  border-radius: var(--radius-md);
  overflow: hidden;
  border: 1px solid var(--border-subtle);
  position: relative;
  transition: all var(--transition-normal);
}

.creative-tile:hover {
  border-color: var(--accent-primary);
  box-shadow: var(--hover-glow);
  transform: scale(1.02);
  z-index: 2;
}

.tile-0 { grid-column: 1 / 4; grid-row: 1 / 3; }
.tile-1 { grid-column: 4 / 8; grid-row: 1; }
.tile-2 { grid-column: 8 / 13; grid-row: 1; }
.tile-3 { grid-column: 4 / 7; grid-row: 2; }
.tile-4 { grid-column: 7 / 13; grid-row: 2; }

.creative-tile img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}
.creative-tile:hover img {
  transform: scale(1.08);
}

.tile-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(180deg, transparent 50%, rgba(9,0,64,0.5) 100%);
}

/* PHILOSOPHY */
.sc-philosophy {
  background: linear-gradient(135deg, rgba(14,0,90,0.3), rgba(9,0,64,0.1));
  border-top: 1px solid var(--border-subtle);
  border-bottom: 1px solid var(--border-subtle);
}

.philosophy-list {
  display: flex;
  flex-direction: column;
  gap: 0;
  margin-top: var(--space-2xl);
}

.philosophy-line {
  display: flex;
  align-items: center;
  gap: var(--space-xl);
  padding: var(--space-lg) 0;
  border-bottom: 1px solid var(--divider-color);
  transition: all var(--transition-fast);
  cursor: default;
}

.philosophy-line:hover {
  padding-left: var(--space-md);
}

.philosophy-line:hover .philo-text {
  color: var(--text-primary);
}

.philo-index {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--accent-primary);
  min-width: 32px;
}

.philo-text {
  font-family: var(--font-display);
  font-size: var(--fs-xl);
  font-weight: 600;
  color: var(--text-secondary);
  transition: color var(--transition-fast);
}

/* FEATURED PROJECT */
.featured-project {
  display: grid;
  grid-template-columns: 1fr 1fr;
  overflow: hidden;
  margin-top: var(--space-xl);
}

.fp-image {
  position: relative;
  height: 400px;
}

.fp-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.fp-badge {
  position: absolute;
  top: var(--space-md);
  left: var(--space-md);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  font-weight: 700;
  background: #00C853;
  color: white;
  padding: 4px 12px;
  border-radius: var(--radius-full);
}

.fp-content {
  padding: var(--space-2xl);
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: var(--space-lg);
}

.fp-subtitle {
  font-family: var(--font-mono);
  font-size: var(--fs-sm);
  color: var(--accent-primary);
}

.fp-desc {
  color: var(--text-secondary);
  font-size: var(--fs-base);
  line-height: 1.7;
}

.fp-stack {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-xs);
}

.fp-actions {
  display: flex;
  gap: var(--space-md);
}

/* CTA */
.cta-inner {
  text-align: center;
  padding: var(--space-3xl);
}

.cta-title {
  font-family: var(--font-display);
  font-size: var(--fs-4xl);
  font-weight: 800;
  margin-bottom: var(--space-lg);
  line-height: 1.1;
}

.cta-sub {
  color: var(--text-secondary);
  font-size: var(--fs-lg);
  margin-bottom: var(--space-xl);
}

@media (max-width: 768px) {
  .hero-inner,
  .achievement-item,
  .skill-item,
  .skill-item.reverse,
  .featured-project {
    grid-template-columns: 1fr;
    direction: ltr;
  }
  .hero-images-grid {
    display: none;
  }
  .hero-headline {
    font-size: var(--fs-3xl);
  }
  .achievement-image {
    height: 180px;
  }
  .achievement-content {
    padding: var(--space-lg);
  }
  .creative-tiles {
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: auto;
  }
  .tile-0, .tile-1, .tile-2, .tile-3, .tile-4 {
    grid-column: auto;
    grid-row: auto;
  }
  .philo-text {
    font-size: var(--fs-base);
  }
}
</style>
