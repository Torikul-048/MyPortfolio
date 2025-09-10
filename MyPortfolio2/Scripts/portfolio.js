// Portfolio JavaScript - Enhanced with Timeline Animations

document.addEventListener('DOMContentLoaded', function () {
    initializePortfolio();
});

function initializePortfolio() {
    setupSmoothScrolling();
    setupMobileMenu();
    setupScrollAnimations();
    setupTimelineAnimations();
    animateSkillBars();
    setupActiveNavLinks();
    setupNavbarScroll();
}

// Smooth scrolling for navigation links
function setupSmoothScrolling() {
    const navLinks = document.querySelectorAll('.nav-link[href^="#"]');

    navLinks.forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();

            const targetId = this.getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);

            if (targetSection) {
                const headerHeight = 80;
                const targetPosition = targetSection.offsetTop - headerHeight;

                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });

                // Close mobile menu if open
                const navMenu = document.querySelector('.nav-menu');
                const mobileToggle = document.querySelector('.mobile-menu-toggle');
                if (navMenu && mobileToggle) {
                    navMenu.classList.remove('active');
                    mobileToggle.classList.remove('active');
                }
            }
        });
    });
}

// Mobile menu toggle
function setupMobileMenu() {
    const mobileToggle = document.querySelector('.mobile-menu-toggle');
    const navMenu = document.querySelector('.nav-menu');

    if (mobileToggle && navMenu) {
        mobileToggle.addEventListener('click', function () {
            navMenu.classList.toggle('active');
            this.classList.toggle('active');
        });

        // Close menu when clicking outside
        document.addEventListener('click', function (e) {
            if (!mobileToggle.contains(e.target) && !navMenu.contains(e.target)) {
                navMenu.classList.remove('active');
                mobileToggle.classList.remove('active');
            }
        });

        // Close menu when clicking on a nav link
        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            link.addEventListener('click', function () {
                navMenu.classList.remove('active');
                mobileToggle.classList.remove('active');
            });
        });
    }
}

// Enhanced scroll animations
function setupScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate');

                // Trigger skill bar animations when skills section is visible
                if (entry.target.id === 'skills') {
                    setTimeout(animateSkillBars, 300);
                }
            }
        });
    }, observerOptions);

    // Observe sections and cards
    const elementsToAnimate = document.querySelectorAll('section, .education-item, .project-card');
    elementsToAnimate.forEach(element => {
        element.classList.add('animate-on-scroll');
        observer.observe(element);
    });
}

// Enhanced Timeline Animations with Staggered Delays
function setupTimelineAnimations() {
    const timelineObserver = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const timelineItems = document.querySelectorAll('.timeline-item');
                
                timelineItems.forEach((item, index) => {
                    const delay = item.getAttribute('data-delay') || (index * 200);
                    
                    setTimeout(() => {
                        item.classList.add('animate');
                        
                        // Animate timeline line growth
                        const timelineLine = document.querySelector('.timeline-line');
                        if (timelineLine && index === 0) {
                            timelineLine.style.animation = 'timelineGrow 2s ease-out forwards';
                        }
                    }, parseInt(delay));
                });
            }
        });
    }, {
        threshold: 0.2,
        rootMargin: '0px 0px -100px 0px'
    });

    const educationSection = document.getElementById('education');
    if (educationSection) {
        timelineObserver.observe(educationSection);
    }
}

// Animate skill progress bars
function animateSkillBars() {
    const progressBars = document.querySelectorAll('.progress-fill');

    progressBars.forEach((bar, index) => {
        const targetWidth = bar.getAttribute('data-level');

        setTimeout(() => {
            bar.style.width = targetWidth + '%';
        }, index * 150); // Stagger animations
    });
}

// Update active navigation link based on scroll position
function setupActiveNavLinks() {
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-link[href^="#"]');

    window.addEventListener('scroll', function () {
        let current = '';
        const headerHeight = 80;

        sections.forEach(section => {
            const sectionTop = section.offsetTop - headerHeight - 100;
            const sectionHeight = section.offsetHeight;

            if (window.scrollY >= sectionTop && window.scrollY < sectionTop + sectionHeight) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === '#' + current) {
                link.classList.add('active');
            }
        });
    });
}

// Enhanced navbar background on scroll
function setupNavbarScroll() {
    window.addEventListener('scroll', function () {
        const navbar = document.querySelector('.navbar');

        if (navbar) {
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        }
    });
}

// Add CSS animation for timeline line growth
const style = document.createElement('style');
style.textContent = `
            @keyframes timelineGrow {
        from {
            height: 0;
            opacity: 0;
        }
        to {
            height: 100%;
            opacity: 1;
        }
    }
    
    .timeline-line {
        height: 0;
        opacity: 0;
    }
`;
document.head.appendChild(style);

// Shortcut: Alt + A → Admin dashboard
document.addEventListener('keydown', (event) => {
    if (event.altKey && event.key === 'a') {
        event.preventDefault();
        window.location.href = 'https://localhost:44306/Admin/Dashboard';
    }
});