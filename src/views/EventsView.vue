<script setup lang="ts">
import { ref } from 'vue'
import { timelineEvents } from '@/data/mockup'
import type { TimelineEvent } from '@/data/mockup'

const selectedEvent = ref<TimelineEvent | null>(null)

const openEvent = (event: TimelineEvent) => {
  selectedEvent.value = event
  document.body.style.overflow = 'hidden'
}

const closeEvent = () => {
  selectedEvent.value = null
  document.body.style.overflow = ''
}

const getCategoryColor = (cat: string): string => {
  const map: Record<string, string> = {
    Learning: '#B13BFF',
    Education: '#FFCC00',
    Achievement: '#00C853',
  }
  return map[cat] || '#B13BFF'
}

// SVG viewbox for the atom-like layout
const svgW = 1000
const svgH = 500
</script>

<template>
  <div class="events-page">
    <div class="section-container" style="padding-top: 100px; padding-bottom: var(--space-3xl);">
      <p class="section-label">Events</p>
      <h1 class="section-title">The<br /><span class="gradient-text">Timeline</span></h1>
      <p class="events-sub">Key moments. Connected journeys. Atomic precision.</p>

      <!-- Atom particle SVG canvas -->
      <div class="atom-container">
        <svg
          :viewBox="`0 0 ${svgW} ${svgH}`"
          class="atom-svg"
          xmlns="http://www.w3.org/2000/svg"
        >
          <!-- Connection lines -->
          <g class="connections">
            <template v-for="event in timelineEvents" :key="`lines-${event.id}`">
              <template v-for="targetId in event.connections" :key="`line-${event.id}-${targetId}`">
                <line
                  v-if="timelineEvents.find(e => e.id === targetId)"
                  :x1="`${event.x}%`"
                  :y1="`${event.y}%`"
                  :x2="`${timelineEvents.find(e => e.id === targetId)!.x}%`"
                  :y2="`${timelineEvents.find(e => e.id === targetId)!.y}%`"
                  class="connection-line"
                  :stroke="getCategoryColor(event.category)"
                />
              </template>
            </template>
          </g>

          <!-- Orbit rings (decorative) -->
          <ellipse cx="50%" cy="50%" rx="38%" ry="20%" fill="none" stroke="rgba(177,59,255,0.06)" stroke-width="1" />
          <ellipse cx="50%" cy="50%" rx="25%" ry="35%" fill="none" stroke="rgba(255,204,0,0.04)" stroke-width="1" transform="rotate(60 500 250)" />

          <!-- Event nodes -->
          <g
            v-for="event in timelineEvents"
            :key="event.id"
            :transform="`translate(${event.x * svgW / 100}, ${event.y * svgH / 100})`"
            class="event-node"
            @click="openEvent(event)"
            style="cursor: pointer;"
          >
            <!-- Outer glow ring -->
            <circle
              r="36"
              :fill="`rgba(177,59,255,0.08)`"
              :stroke="getCategoryColor(event.category)"
              stroke-width="1"
              stroke-dasharray="4 2"
              class="node-ring"
            />
            <!-- Image circle clip -->
            <defs>
              <clipPath :id="`clip-${event.id}`">
                <circle r="28" />
              </clipPath>
            </defs>
            <image
              :href="event.image"
              x="-28" y="-28"
              width="56" height="56"
              :clip-path="`url(#clip-${event.id})`"
              preserveAspectRatio="xMidYMid slice"
              class="node-image"
            />
            <circle
              r="28"
              fill="none"
              :stroke="getCategoryColor(event.category)"
              stroke-width="2"
            />
            <!-- Year label -->
            <text
              y="48"
              text-anchor="middle"
              class="node-year"
              :fill="getCategoryColor(event.category)"
              font-family="'Space Mono', monospace"
              font-size="11"
              font-weight="700"
            >{{ event.year }}</text>
            <!-- Title label -->
            <text
              y="62"
              text-anchor="middle"
              fill="rgba(207,203,255,0.8)"
              font-family="'Syne', sans-serif"
              font-size="9"
              font-weight="600"
            >{{ event.title }}</text>
          </g>
        </svg>
      </div>

      <!-- Category legend -->
      <div class="legend">
        <div v-for="cat in ['Learning', 'Education', 'Achievement']" :key="cat" class="legend-item">
          <span class="legend-dot" :style="{ background: getCategoryColor(cat) }" />
          <span class="legend-label">{{ cat }}</span>
        </div>
      </div>

      <!-- Event cards list (mobile + accessibility fallback) -->
      <div class="events-list">
        <div
          v-for="event in timelineEvents"
          :key="event.id"
          class="event-list-card glass-card"
          @click="openEvent(event)"
        >
          <div class="elc-image">
            <img :src="event.image" :alt="event.title" />
          </div>
          <div class="elc-content">
            <span class="elc-year" :style="{ color: getCategoryColor(event.category) }">{{ event.year }}</span>
            <h3 class="elc-title">{{ event.title }}</h3>
            <p class="elc-desc">{{ event.description }}</p>
            <span class="elc-cat" :style="{ borderColor: getCategoryColor(event.category), color: getCategoryColor(event.category) }">
              {{ event.category }}
            </span>
          </div>
        </div>
      </div>
    </div>

    <!-- Event detail overlay -->
    <Transition name="overlay">
      <div v-if="selectedEvent" class="event-overlay" @click.self="closeEvent">
        <div class="event-modal glass-card">
          <button class="modal-close" @click="closeEvent">✕</button>
          <div class="modal-inner">
            <div class="modal-image">
              <img :src="selectedEvent.image" :alt="selectedEvent.title" />
              <div class="modal-image-overlay" />
              <div class="modal-badge" :style="{ background: getCategoryColor(selectedEvent.category) }">
                {{ selectedEvent.category }}
              </div>
            </div>
            <div class="modal-content">
              <span class="modal-year" :style="{ color: getCategoryColor(selectedEvent.category) }">
                {{ selectedEvent.year }}
              </span>
              <h2 class="modal-title">{{ selectedEvent.title }}</h2>
              <p class="modal-desc">{{ selectedEvent.description }}</p>
              <div class="modal-divider" />
              <p class="modal-details">{{ selectedEvent.details }}</p>
            </div>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<style scoped>
.events-page {
  min-height: 100vh;
}

.events-sub {
  color: var(--text-muted);
  font-size: var(--fs-lg);
  margin-bottom: var(--space-2xl);
  font-family: var(--font-mono);
}

/* Atom canvas */
.atom-container {
  width: 100%;
  margin-bottom: var(--space-2xl);
  border-radius: var(--radius-xl);
  overflow: hidden;
  background: linear-gradient(135deg, rgba(14, 0, 90, 0.4), rgba(9, 0, 64, 0.2));
  border: 1px solid var(--border-subtle);
  padding: var(--space-xl);
}

.atom-svg {
  width: 100%;
  height: auto;
}

.connection-line {
  stroke-width: 1;
  stroke-dasharray: 4 3;
  opacity: 0.4;
}

.node-ring {
  animation: spin 20s linear infinite;
  transform-origin: center;
}

.node-image {
  transition: opacity 0.3s ease;
}

.event-node:hover .node-ring {
  stroke-opacity: 0.9;
}

/* Legend */
.legend {
  display: flex;
  gap: var(--space-xl);
  margin-bottom: var(--space-2xl);
  justify-content: center;
  flex-wrap: wrap;
}

.legend-item {
  display: flex;
  align-items: center;
  gap: var(--space-sm);
}

.legend-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
}

.legend-label {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.1em;
}

/* Event list */
.events-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: var(--space-lg);
}

.event-list-card {
  display: flex;
  gap: var(--space-lg);
  padding: var(--space-lg);
  cursor: pointer;
  transition: all var(--transition-normal);
  overflow: hidden;
}

.event-list-card:hover {
  box-shadow: var(--glass-shadow-strong);
  transform: translateY(-3px);
  border-color: var(--border-strong);
}

.elc-image {
  flex-shrink: 0;
  width: 70px;
  height: 70px;
  border-radius: 50%;
  overflow: hidden;
  border: 2px solid var(--border-subtle);
}

.elc-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.elc-content {
  flex: 1;
  min-width: 0;
}

.elc-year {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  font-weight: 700;
  display: block;
  margin-bottom: 2px;
}

.elc-title {
  font-family: var(--font-display);
  font-size: var(--fs-base);
  font-weight: 700;
  margin-bottom: 4px;
}

.elc-desc {
  font-size: var(--fs-xs);
  color: var(--text-muted);
  margin-bottom: var(--space-sm);
}

.elc-cat {
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  padding: 2px 10px;
  border: 1px solid;
  border-radius: var(--radius-full);
}

/* Event detail modal */
.event-overlay {
  position: fixed;
  inset: 0;
  background: rgba(9, 0, 64, 0.92);
  backdrop-filter: blur(20px);
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: var(--space-xl);
}

.event-modal {
  max-width: 800px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
}

.modal-close {
  position: absolute;
  top: var(--space-lg);
  right: var(--space-lg);
  width: 36px;
  height: 36px;
  background: var(--glass-bg);
  border: 1px solid var(--border-strong);
  color: var(--text-primary);
  border-radius: 50%;
  cursor: pointer;
  transition: all var(--transition-fast);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--fs-sm);
  z-index: 1;
}

.modal-close:hover {
  background: var(--accent-primary);
  border-color: var(--accent-primary);
}

.modal-inner {
  display: grid;
  grid-template-columns: 320px 1fr;
}

.modal-image {
  position: relative;
  height: 100%;
  min-height: 320px;
}

.modal-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.modal-image-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(90deg, transparent 50%, rgba(17,0,80,0.35) 100%);
}

.modal-badge {
  position: absolute;
  top: var(--space-md);
  left: var(--space-md);
  font-family: var(--font-mono);
  font-size: var(--fs-xs);
  font-weight: 700;
  padding: 4px 12px;
  border-radius: var(--radius-full);
  color: white;
}

.modal-content {
  padding: var(--space-2xl);
}

.modal-year {
  font-family: var(--font-mono);
  font-size: var(--fs-sm);
  font-weight: 700;
  display: block;
  margin-bottom: var(--space-sm);
}

.modal-title {
  font-family: var(--font-display);
  font-size: var(--fs-2xl);
  font-weight: 800;
  margin-bottom: var(--space-sm);
  line-height: 1.2;
}

.modal-desc {
  font-family: var(--font-mono);
  font-size: var(--fs-sm);
  color: var(--text-muted);
  margin-bottom: var(--space-lg);
}

.modal-divider {
  height: 1px;
  background: var(--divider-color);
  margin-bottom: var(--space-lg);
}

.modal-details {
  font-size: var(--fs-base);
  color: var(--text-secondary);
  line-height: 1.7;
}

.overlay-enter-active,
.overlay-leave-active {
  transition: all var(--transition-normal);
}
.overlay-enter-from,
.overlay-leave-to {
  opacity: 0;
}

@media (max-width: 768px) {
  .atom-container {
    display: none;
  }
  .modal-inner {
    grid-template-columns: 1fr;
  }
  .modal-image {
    min-height: 200px;
    max-height: 200px;
  }
}
</style>
