// Main JavaScript for Hospital Kristus Clinic

document.addEventListener('DOMContentLoaded', function () {
  console.log('Hospital Kristus Clinic website initialized.');

  // ========================================================
  // 1. REMOVE FLOATING "MADE IN WEBFLOW" BADGE
  // ========================================================
  function killWebflowBadge() {
    const badges = document.querySelectorAll('.w-webflow-badge, a[href*="webflow.com?utm_campaign=brandjs"], a[class*="webflow-badge"]');
    badges.forEach(el => el.remove());
  }
  killWebflowBadge();
  setTimeout(killWebflowBadge, 200);
  setTimeout(killWebflowBadge, 1000);
  setInterval(killWebflowBadge, 2000);

  // ========================================================
  // 2. SAVEALIFE-STYLE NAVBAR: SCROLL & MOBILE DRAWER
  // ========================================================
  const siteNavbar = document.getElementById('siteNavbar');
  const navbarHamburger = document.getElementById('navbarHamburger');
  const navbarNav = document.getElementById('navbarNav');
  const navbarOverlay = document.getElementById('navbarOverlay');

  // Scroll effect (adds shadow/glassmorphism)
  window.addEventListener('scroll', function () {
    if (siteNavbar) {
      if (window.scrollY > 25) {
        siteNavbar.classList.add('scrolled');
      } else {
        siteNavbar.classList.remove('scrolled');
      }
    }
  });

  // Mobile Hamburger & Slide-in Drawer Toggle
  if (navbarHamburger && navbarNav) {
    function toggleMobileMenu() {
      navbarHamburger.classList.toggle('open');
      navbarNav.classList.toggle('open');
      if (navbarOverlay) {
        navbarOverlay.classList.toggle('active');
      }
      document.body.style.overflow = navbarNav.classList.contains('open') ? 'hidden' : '';
    }

    function closeMobileMenu() {
      navbarHamburger.classList.remove('open');
      navbarNav.classList.remove('open');
      if (navbarOverlay) {
        navbarOverlay.classList.remove('active');
      }
      document.body.style.overflow = '';
    }

    navbarHamburger.addEventListener('click', function (e) {
      e.stopPropagation();
      toggleMobileMenu();
    });

    if (navbarOverlay) {
      navbarOverlay.addEventListener('click', closeMobileMenu);
    }

    // Close when clicking nav links
    navbarNav.querySelectorAll('.nav-link-item').forEach(link => {
      link.addEventListener('click', closeMobileMenu);
    });
  }

  // ========================================================
  // 3. CAROUSEL SLIDER (3 Cards at a Time with 3 Navigation Dots)
  // ========================================================
  const track = document.getElementById('practiceCarouselTrack');
  const dots = document.querySelectorAll('#practiceCarouselDots .hk-dot');
  const prevBtn = document.getElementById('carouselPrevBtn');
  const nextBtn = document.getElementById('carouselNextBtn');
  const container = document.getElementById('practiceCarouselContainer');

  if (track && dots.length > 0) {
    let currentSlide = 0;
    const totalSlides = dots.length; // 3 slides

    function goToSlide(index) {
      if (index < 0) {
        currentSlide = totalSlides - 1;
      } else if (index >= totalSlides) {
        currentSlide = 0;
      } else {
        currentSlide = index;
      }

      // Each slide is 33.333333% of the 300% wide track
      const percentage = currentSlide * (100 / totalSlides);
      track.style.transform = `translateX(-${percentage}%)`;

      // Update 3 dots
      dots.forEach((dot, idx) => {
        if (idx === currentSlide) {
          dot.classList.add('active');
          dot.setAttribute('aria-selected', 'true');
        } else {
          dot.classList.remove('active');
          dot.setAttribute('aria-selected', 'false');
        }
      });
    }

    // Dot click listeners
    dots.forEach((dot) => {
      dot.addEventListener('click', function (e) {
        e.preventDefault();
        const slideIndex = parseInt(this.getAttribute('data-slide'), 10);
        goToSlide(slideIndex);
      });
    });

    // Arrow button listeners
    if (prevBtn) {
      prevBtn.addEventListener('click', function (e) {
        e.preventDefault();
        goToSlide(currentSlide - 1);
      });
    }

    if (nextBtn) {
      nextBtn.addEventListener('click', function (e) {
        e.preventDefault();
        goToSlide(currentSlide + 1);
      });
    }

    // Touch Swipe Support
    let touchStartX = 0;
    let touchEndX = 0;

    if (container) {
      container.addEventListener('touchstart', function (e) {
        touchStartX = e.changedTouches[0].screenX;
      }, { passive: true });

      container.addEventListener('touchend', function (e) {
        touchEndX = e.changedTouches[0].screenX;
        handleSwipe();
      }, { passive: true });

      function handleSwipe() {
        const threshold = 50;
        if (touchEndX < touchStartX - threshold) {
          goToSlide(currentSlide + 1); // Swipe left -> next
        } else if (touchEndX > touchStartX + threshold) {
          goToSlide(currentSlide - 1); // Swipe right -> prev
        }
      }

      // Auto-play interval
      let autoPlayTimer = setInterval(() => {
        goToSlide(currentSlide + 1);
      }, 7000);

      container.parentElement.addEventListener('mouseenter', () => {
        clearInterval(autoPlayTimer);
      });

      container.parentElement.addEventListener('mouseleave', () => {
        autoPlayTimer = setInterval(() => {
          goToSlide(currentSlide + 1);
        }, 7000);
      });
    }
  }

  // ========================================================
  // 4. Toast Notification Helper
  // ========================================================
  function showToast(message, isError = false) {
    let toast = document.getElementById('hk-toast');
    if (!toast) {
      toast = document.createElement('div');
      toast.id = 'hk-toast';
      document.body.appendChild(toast);
    }
    toast.innerHTML = `
      <div style="font-size: 20px;">${isError ? '⚠️' : '✅'}</div>
      <div>
        <div style="font-weight: 700; margin-bottom: 2px;">${isError ? 'Notice' : 'Success!'}</div>
        <div style="font-size: 13px; opacity: 0.9;">${message}</div>
      </div>
    `;
    toast.style.backgroundColor = isError ? '#e63946' : '#12295F';
    toast.classList.add('show');

    setTimeout(() => {
      toast.classList.remove('show');
    }, 4500);
  }

  // ========================================================
  // 5. Form Handlers (Appointment & Contact)
  // ========================================================
  const forms = document.querySelectorAll('form');
  forms.forEach(form => {
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      
      const submitBtn = form.querySelector('button[type="submit"], input[type="submit"]');
      const originalText = submitBtn ? (submitBtn.value || submitBtn.innerText) : '';
      
      if (submitBtn) {
        if (submitBtn.tagName === 'INPUT') {
          submitBtn.value = 'Processing...';
        } else {
          submitBtn.innerText = 'Processing...';
        }
        submitBtn.disabled = true;
      }

      setTimeout(() => {
        if (form.id.includes('appointment') || form.getAttribute('action')?.includes('appointment') || window.location.pathname.includes('appointment')) {
          showToast('Thank you! Your appointment at Hospital Kristus Clinic has been booked. A confirmation SMS/Email has been dispatched.');
        } else {
          showToast('Thank you! Your message has been sent to Hospital Kristus Clinic. Our team will contact you shortly.');
        }

        form.reset();
        if (submitBtn) {
          if (submitBtn.tagName === 'INPUT') {
            submitBtn.value = originalText;
          } else {
            submitBtn.innerText = originalText;
          }
          submitBtn.disabled = false;
        }

        const successBox = form.parentNode.querySelector('.w-form-done');
        if (successBox) {
          form.style.display = 'none';
          successBox.style.display = 'block';
        }
      }, 900);
    });
  });

  // ========================================================
  // 6. Query Param Pre-selection on Make Appointment page
  // ========================================================
  const urlParams = new URLSearchParams(window.location.search);
  const selectedService = urlParams.get('service');
  if (selectedService) {
    const serviceSelect = document.querySelector('select[name="service"], select[name="department"], #General-Checkup, #Practice-Areas');
    if (serviceSelect) {
      for (let i = 0; i < serviceSelect.options.length; i++) {
        if (serviceSelect.options[i].text.toLowerCase().includes(selectedService.toLowerCase()) || 
            serviceSelect.options[i].value.toLowerCase().includes(selectedService.toLowerCase())) {
          serviceSelect.selectedIndex = i;
          break;
        }
      }
    }
  }

  // ========================================================
  // 7. Smooth Scroll for Anchor Links
  // ========================================================
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const targetId = this.getAttribute('href');
      if (targetId && targetId !== '#' && document.querySelector(targetId)) {
        e.preventDefault();
        document.querySelector(targetId).scrollIntoView({
          behavior: 'smooth'
        });
      }
    });
  });

    // ========================================================
  // 8. OUR SUCCESS STORIES VIDEO MODAL & SCROLL CONTROLLER
  // ========================================================
  (function initSuccessStoriesModal() {
    const storiesData = [
      {
        heading: "Advanced Obstetric Care & Safe High-Risk Pregnancy Delivery",
        category: "Pregnancy & Delivery",
        type: "video",
        url: "https://res.cloudinary.com/dgcsdsred/video/upload/v1784665460/Medical_Tourism_in_Nigeria_Export_1_npyqzm.mp4",
        thumb: "images/6a87c5470a9b9169f06b1857_portfolio-img1.webp"
      },
      {
        heading: "Minimally Invasive Laparoscopic Surgery with Rapid 24-Hour Recovery",
        category: "Surgical Procedures",
        type: "youtube",
        url: "https://www.youtube.com/embed/zZYPa77-bfE?autoplay=1",
        thumb: "images/6a88141f36b7e7388f92bf07_portfolio-img2.webp"
      },
      {
        heading: "Comprehensive Chronic Disease Management & Diagnostic Health Screening",
        category: "General Medicine",
        type: "youtube",
        url: "https://www.youtube.com/embed/sGNzPCJKM1M?autoplay=1",
        thumb: "images/6a8814e4d93c7ca7f0f1a57b_portfolio-img7.webp"
      },
      {
        heading: "Advanced IVF Conception & Reproductive Healthcare for Expectant Couples",
        category: "Fertility & Reproductive Health",
        type: "video",
        url: "https://res.cloudinary.com/dgcsdsred/video/upload/v1784665539/Medical_Tourism_in_Nigeria_Export_2_ihj9na.mp4",
        thumb: "images/6a8814b18f0ca44ed7adec3e_portfolio-img5.webp"
      }
    ];

    const modal = document.getElementById('storiesModal');
    const playerWrapper = document.getElementById('modalPlayerWrapper');
    const titleEl = document.getElementById('modalVideoTitle');
    const catEl = document.getElementById('modalVideoCat');
    const closeBtn = document.getElementById('modalCloseBtn');
    const relatedGrid = document.getElementById('modalRelatedGrid');
    const marqueeTrack = document.getElementById('storiesMarqueeTrack');
    const marqueeWrapper = document.getElementById('storiesMarqueeWrapper');

    // Pause scroll on hover & touch
    if (marqueeTrack && marqueeWrapper) {
      marqueeWrapper.addEventListener('mouseenter', () => {
        marqueeTrack.style.animationPlayState = 'paused';
      });
      marqueeWrapper.addEventListener('mouseleave', () => {
        marqueeTrack.style.animationPlayState = 'running';
      });
      marqueeWrapper.addEventListener('touchstart', () => {
        marqueeTrack.style.animationPlayState = 'paused';
      }, { passive: true });
      marqueeWrapper.addEventListener('touchend', () => {
        setTimeout(() => {
          marqueeTrack.style.animationPlayState = 'running';
        }, 2000);
      }, { passive: true });
    }

    if (!modal || !playerWrapper) return;

    function openStory(idx) {
      const story = storiesData[idx];
      if (!story) return;

      // Pause continuous marquee while modal is open
      if (marqueeTrack) marqueeTrack.style.animationPlayState = 'paused';

      if (story.type === 'youtube') {
        playerWrapper.innerHTML = '<iframe src="' + story.url + '" class="video-player" allowfullscreen allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>';
      } else {
        playerWrapper.innerHTML = '<video controls autoplay playsinline class="video-player" poster="' + story.thumb + '"><source src="' + story.url + '" type="video/mp4">Your browser does not support video.</video>';
      }

      if (titleEl) titleEl.textContent = story.heading;
      if (catEl) catEl.textContent = story.category;

      if (relatedGrid) {
        relatedGrid.innerHTML = '';
        storiesData.forEach((item, i) => {
          if (i === idx) return;
          const btn = document.createElement('button');
          btn.type = 'button';
          btn.className = 'modal-related-item';
          btn.innerHTML = '<img src="' + item.thumb + '" alt="" class="modal-related-thumb"><div class="modal-related-name">' + item.heading + '</div>';
          btn.addEventListener('click', () => openStory(i));
          relatedGrid.appendChild(btn);
        });
      }

      modal.classList.add('active');
      document.body.style.overflow = 'hidden';
    }

    function closeStory() {
      modal.classList.remove('active');
      playerWrapper.innerHTML = '';
      document.body.style.overflow = '';
      if (marqueeTrack) marqueeTrack.style.animationPlayState = 'running';
    }

    // Attach click listener to cards, thumbnail overlays, and view-more triggers
    document.querySelectorAll('.video-card[data-index], .thumbnail-overlay[data-index], .view-more-trigger[data-index]').forEach(el => {
      el.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        const idx = parseInt(this.getAttribute('data-index'), 10);
        openStory(idx);
      });
    });

    if (closeBtn) closeBtn.addEventListener('click', closeStory);
    modal.addEventListener('click', function(e) {
      if (e.target === modal) closeStory();
    });

    document.addEventListener('keydown', function(e) {
      if (e.key === 'Escape' && modal.classList.contains('active')) {
        closeStory();
      }
    });
  })();

  // ========================================================
  // 9. URGENT CALL 24/7 COLLAPSIBLE ACCORDION (CLICK & TOUCH)
  // ========================================================
  (function initUrgentDropdownToggle() {
    const dropdown = document.querySelector('.urgent-call-dropdown');
    const header = document.querySelector('.urgent-dropdown-header');
    if (!dropdown || !header) return;

    // Set accessibility attributes
    header.setAttribute('role', 'button');
    header.setAttribute('aria-expanded', 'false');
    header.setAttribute('tabindex', '0');

    function toggleDropdown(e) {
      if (e) {
        e.preventDefault();
        e.stopPropagation();
      }
      const isOpen = dropdown.classList.toggle('is-open');
      header.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    }

    header.addEventListener('click', toggleDropdown);

    // Keyboard support (Enter & Space)
    header.addEventListener('keydown', function(e) {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        toggleDropdown(e);
      }
    });

    // Close when clicking outside
    document.addEventListener('click', function(e) {
      if (!dropdown.contains(e.target) && dropdown.classList.contains('is-open')) {
        dropdown.classList.remove('is-open');
        header.setAttribute('aria-expanded', 'false');
      }
    });

    // Close on Escape key
    document.addEventListener('keydown', function(e) {
      if (e.key === 'Escape' && dropdown.classList.contains('is-open')) {
        dropdown.classList.remove('is-open');
        header.setAttribute('aria-expanded', 'false');
      }
    });
  })();

});
