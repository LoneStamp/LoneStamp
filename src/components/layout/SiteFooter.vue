<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { profile, visitorsData } from '@/data/mockup'

const currentYear = new Date().getFullYear()
const email = ref('')
const subscribed = ref(false)

const totalVisitors = visitorsData.reduce((sum, v) => sum + v.count, 0)

const subscribe = () => {
  if (email.value.includes('@')) {
    subscribed.value = true
  }
}

// Simple world map dots using SVG paths for continents
const visitorDots = visitorsData.map(v => ({
  ...v,
  // Convert lat/lng to SVG coordinates (Mercator-ish)
  svgX: ((v.lng + 180) / 360) * 100,
  svgY: ((90 - v.lat) / 180) * 100,
}))
</script>

<template>
  <footer class="site-footer">
    <!-- Geo map section -->
    <div class="footer-map-section">
      <div class="section-container">
        <div class="map-header">
          <p class="section-label">Visitors</p>
          <h2 class="map-title">Where You're<br /><span class="gradient-text">From.</span></h2>
          <p class="map-total">{{ totalVisitors.toLocaleString() }} total visitors worldwide</p>
        </div>

        <div class="geo-map-wrap glass-card">
          <!-- SVG World Map (simplified) -->
          <svg viewBox="0 0 100 55" class="world-map" xmlns="http://www.w3.org/2000/svg">
            <!-- Grid lines -->
            <line x1="0" y1="27.5" x2="100" y2="27.5" stroke="rgba(177,59,255,0.1)" stroke-width="0.2"/>
            <line x1="50" y1="0" x2="50" y2="55" stroke="rgba(177,59,255,0.1)" stroke-width="0.2"/>
            <!-- Continents paths (very simplified SVG shapes) -->
            <!-- North America -->
            <path d="M5,8 L22,8 L24,14 L18,22 L10,20 L6,14 Z" fill="rgba(177,59,255,0.15)" stroke="rgba(177,59,255,0.3)" stroke-width="0.3"/>
            <!-- South America -->
            <path d="M18,26 L28,26 L30,38 L22,42 L16,36 Z" fill="rgba(177,59,255,0.12)" stroke="rgba(177,59,255,0.25)" stroke-width="0.3"/>
            <!-- Europe -->
            <path d="M44,6 L54,6 L56,14 L50,18 L42,14 Z" fill="rgba(177,59,255,0.15)" stroke="rgba(177,59,255,0.3)" stroke-width="0.3"/>
            <!-- Africa -->
            <path d="M46,18 L56,18 L58,36 L50,40 L44,34 Z" fill="rgba(177,59,255,0.12)" stroke="rgba(177,59,255,0.25)" stroke-width="0.3"/>
            <!-- Asia -->
            <path d="M56,5 L82,5 L86,18 L78,26 L60,24 L54,14 Z" fill="rgba(177,59,255,0.15)" stroke="rgba(177,59,255,0.3)" stroke-width="0.3"/>
            <!-- Australia -->
            <path d="M72,34 L84,34 L86,44 L76,46 L70,40 Z" fill="rgba(177,59,255,0.1)" stroke="rgba(177,59,255,0.2)" stroke-width="0.3"/>

            <!-- Visitor dots -->
            <g v-for="visitor in visitorDots" :key="visitor.country">
              <circle
                :cx="visitor.svgX"
                :cy="visitor.svgY"
                :r="Math.min(Math.sqrt(visitor.count / 50), 2.5)"
                :fill="visitor.count > 800 ? '#B13BFF' : visitor.count > 300 ? '#FFCC00' : '#8F8BCB'"
                opacity="0.85"
                class="visitor-dot"
              >
                <title>{{ visitor.country }}: {{ visitor.count.toLocaleString() }} visitors</title>
              </circle>
              <circle
                :cx="visitor.svgX"
                :cy="visitor.svgY"
                :r="Math.min(Math.sqrt(visitor.count / 50), 2.5) + 1.5"
                :fill="visitor.count > 800 ? '#B13BFF' : '#FFCC00'"
                opacity="0.2"
                class="visitor-dot-pulse"
              />
            </g>
          </svg>

          <!-- Visitor stats -->
          <div class="map-stats">
            <div
              v-for="v in visitorsData.slice(0, 5)"
              :key="v.country"
              class="visitor-stat"
            >
              <span class="stat-country">{{ v.country }}</span>
              <div class="stat-bar-wrap">
                <div
                  class="stat-bar"
                  :style="{ width: `${(v.count / visitorsData[0].count) * 100}%` }"
                />
              </div>
              <span class="stat-count">{{ v.count.toLocaleString() }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Footer main -->
    <div class="footer-main">
      <div class="section-container">
        <div class="footer-grid">
          <!-- Brand -->
          <div class="footer-brand">
            <div class="footer-logo">
              <span class="logo-bracket">[</span>
              <span class="logo-name">JEDNAZ</span>
              <span class="logo-bracket">]</span>
            </div>
            <p class="footer-bio">{{ profile.tagline }} — Building systems that outlast trends.</p>
            <p class="footer-location">
              <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
                <circle cx="12" cy="10" r="3"/>
              </svg>
              {{ profile.location }}
            </p>
            <p class="footer-email">
              <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                <polyline points="22,6 12,13 2,6"/>
              </svg>
              <a :href="`mailto:${profile.email}`">{{ profile.email }}</a>
            </p>
          </div>

          <!-- Pages -->
          <div class="footer-col">
            <h4 class="footer-col-title">Pages</h4>
            <RouterLink to="/showcase" class="footer-link">Showcase</RouterLink>
            <RouterLink to="/life" class="footer-link">Life</RouterLink>
            <RouterLink to="/gallery" class="footer-link">Gallery</RouterLink>
            <RouterLink to="/projects" class="footer-link">Projects</RouterLink>
            <RouterLink to="/events" class="footer-link">Events</RouterLink>
          </div>

          <!-- Company -->
          <div class="footer-col">
            <h4 class="footer-col-title">BlackBlazent</h4>
            <a href="https://blackblazent.com" target="_blank" class="footer-link">Company Site</a>
            <a href="https://blackvideo.app" target="_blank" class="footer-link">BlackVideo</a>
            <RouterLink to="/projects" class="footer-link">All Projects</RouterLink>
          </div>

          <!-- Legal -->
          <div class="footer-col">
            <h4 class="footer-col-title">Legal</h4>
            <a href="#" class="footer-link">Privacy Policy</a>
            <a href="#" class="footer-link">Terms of Service</a>
            <a href="#" class="footer-link">Cookie Policy</a>
          </div>

          <!-- Newsletter -->
          <div class="footer-newsletter">
            <h4 class="footer-col-title">Newsletter</h4>
            <p class="newsletter-sub">Get notified when I ship something new.</p>
            <div v-if="!subscribed" class="newsletter-form">
              <input
                v-model="email"
                type="email"
                placeholder="your@email.com"
                class="newsletter-input"
                @keyup.enter="subscribe"
              />
              <button class="newsletter-btn" @click="subscribe">→</button>
            </div>
            <p v-else class="newsletter-success">✓ You're subscribed!</p>
          </div>
        </div>

        <!-- Divider -->
        <div class="footer-divider" />

        <!-- Bottom bar -->
        <div class="footer-bottom">
          <div class="footer-socials">
            <a v-for="social in [
              { name: 'GitHub', href: profile.socials.github },
              { name: 'LinkedIn', href: profile.socials.linkedin },
              { name: 'YouTube', href: profile.socials.youtube },
              { name: 'Twitter', href: profile.socials.twitter },
            ]" :key="social.name" :href="social.href" target="_blank" class="social-pill">
              {{ social.name }}
            </a>
          </div>

          <p class="footer-copyright">
            <span class="copyright-symbol">©</span>
            {{ currentYear }} Jednaz Lonestamp / BlackBlazent. All rights reserved.
          </p>
        </div>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.site-footer {
  border-top: 1px solid var(--border-subtle);
  position: relative;
  z-index: 1;
}

/* Map section */
.footer-map-section {
  padding: var(--space-3xl) 0 var(--space-2xl);
  background: linear-gradient(135deg, rgba(14, 0, 90, 0.4), rgba(9, 0, 64, 0.1));
}

.map-header {
  margin-bottom: var(--space-2xl);
}

.map-title {
  font-family: var(--font-display);
  font-size: var(--fs-3xl);
  font-weight: 800;
  margin-bottom: var(--space-sm);
}

.map-total {
  font-family: var(--font-mono);
  font-size: var(--fs-sm);
  color: var(--text-muted);
}

.geo-map-wrap {
  padding: var(--space-xl);
  display: grid;
  grid-template-columns: 1fr 300px;
  gap: var(--space-xl);
  align-items: center;
}

.world-map {
  width: 100%;
  height: auto;
}

.visitor-dot {
  transition: r 0.3s ease;
}

.visitor-dot-pulse {
  animation: pulseGlow 2s ease infinite;
}

.map-stats {
  display: flex;
  flex-direction: column;
  gap: var(--space-md);
}

.visitor-stat {
  display: grid;
  grid-template-columns: 120px 1fr 50px;
  align-items: center;
  gap: var(--space-sm);
}

.stat-country {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-secondary);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.stat-bar-wrap {
  height: 4px;
  background: rgba(177,59,255,0.1);
  border-radius: var(--radius-full);
  overflow: hidden;
}

.stat-bar {
  height: 100%;
  background: var(--accent-gradient-primary);
  border-radius: var(--radius-full);
  transition: width 0.8s ease;
}

.stat-count {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  text-align: right;
}

/* Footer main */
.footer-main {
  padding: var(--space-3xl) 0 var(--space-xl);
}

.footer-grid {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1fr 2fr;
  gap: var(--space-2xl);
}

.footer-logo {
  font-family: var(--font-display);
  font-size: var(--fs-xl);
  font-weight: 800;
  margin-bottom: var(--space-md);
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

.footer-bio {
  font-size: var(--fs-sm);
  color: var(--text-muted);
  line-height: 1.6;
  margin-bottom: var(--space-md);
}

.footer-location,
.footer-email {
  display: flex;
  align-items: center;
  gap: 6px;
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  margin-bottom: 6px;
}

.footer-email a {
  color: var(--accent-primary);
  transition: color var(--transition-fast);
}

.footer-email a:hover {
  color: var(--accent-primary-hover);
}

.footer-col {
  display: flex;
  flex-direction: column;
  gap: var(--space-sm);
}

.footer-col-title {
  font-family: var(--font-display);
  font-size: var(--fs-sm);
  font-weight: 700;
  color: var(--text-primary);
  letter-spacing: 0.05em;
  margin-bottom: var(--space-sm);
}

.footer-link {
  font-size: var(--fs-sm);
  color: var(--text-muted);
  transition: color var(--transition-fast);
  text-decoration: none;
  display: block;
}

.footer-link:hover {
  color: var(--accent-primary-hover);
}

.footer-newsletter {
  display: flex;
  flex-direction: column;
  gap: var(--space-sm);
}

.newsletter-sub {
  font-size: var(--fs-xs);
  color: var(--text-muted);
  line-height: 1.5;
}

.newsletter-form {
  display: flex;
  gap: var(--space-xs);
}

.newsletter-input {
  flex: 1;
  background: var(--glass-bg);
  border: 1px solid var(--border-subtle);
  border-radius: var(--radius-md);
  padding: 10px 14px;
  color: var(--text-primary);
  font-size: var(--fs-sm);
  font-family: var(--font-body);
  outline: none;
  transition: all var(--transition-fast);
}

.newsletter-input:focus {
  border-color: var(--accent-primary);
  box-shadow: 0 0 10px rgba(177, 59, 255, 0.2);
}

.newsletter-input::placeholder {
  color: var(--text-muted);
}

.newsletter-btn {
  width: 40px;
  height: 40px;
  background: var(--accent-gradient-primary);
  border: none;
  border-radius: var(--radius-md);
  color: white;
  font-size: var(--fs-lg);
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all var(--transition-fast);
  flex-shrink: 0;
}

.newsletter-btn:hover {
  box-shadow: var(--hover-glow);
  transform: scale(1.05);
}

.newsletter-success {
  font-family: var(--font-mono);
  font-size: var(--fs-sm);
  color: #00C853;
}

/* Divider & bottom */
.footer-divider {
  height: 1px;
  background: var(--divider-color);
  margin: var(--space-2xl) 0 var(--space-xl);
}

.footer-bottom {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: var(--space-md);
}

.footer-socials {
  display: flex;
  gap: var(--space-sm);
  flex-wrap: wrap;
}

.social-pill {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  border: 1px solid var(--border-subtle);
  padding: 4px 14px;
  border-radius: var(--radius-full);
  transition: all var(--transition-fast);
  text-decoration: none;
}

.social-pill:hover {
  color: var(--accent-primary);
  border-color: var(--accent-primary);
  background: var(--accent-primary-soft);
}

.footer-copyright {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  display: flex;
  align-items: center;
  gap: 4px;
}

.copyright-symbol {
  font-size: var(--fs-sm);
  color: var(--accent-primary);
}

@media (max-width: 1024px) {
  .footer-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  .footer-brand {
    grid-column: 1 / -1;
  }
  .footer-newsletter {
    grid-column: 1 / -1;
  }
  .geo-map-wrap {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 600px) {
  .footer-grid {
    grid-template-columns: 1fr;
  }
}
</style>
