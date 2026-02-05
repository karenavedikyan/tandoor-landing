// Mobile Menu Toggle
const mobileMenuToggle = document.getElementById('mobileMenuToggle');
const nav = document.querySelector('.nav');

if (mobileMenuToggle) {
    mobileMenuToggle.addEventListener('click', () => {
        nav.classList.toggle('active');
        mobileMenuToggle.classList.toggle('active');
    });
}

// Header Scroll Effect
const header = document.getElementById('header');
let lastScroll = 0;

window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset;
    
    if (currentScroll > 100) {
        header.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.15)';
    } else {
        header.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
    }
    
    lastScroll = currentScroll;
});

// Reviews Carousel
const reviewsTrack = document.getElementById('reviewsTrack');
const reviewsPrev = document.getElementById('reviewsPrev');
const reviewsNext = document.getElementById('reviewsNext');
const reviewsDots = document.getElementById('reviewsDots');

let currentReview = 0;
const reviews = document.querySelectorAll('.review-item');
const totalReviews = reviews.length;

// Create dots
if (reviewsDots && reviews.length > 0) {
    reviews.forEach((_, index) => {
        const dot = document.createElement('button');
        dot.classList.add('reviews-dot');
        if (index === 0) dot.classList.add('active');
        dot.addEventListener('click', () => goToReview(index));
        reviewsDots.appendChild(dot);
    });
}

function updateReviewsCarousel() {
    if (reviewsTrack) {
        reviewsTrack.style.transform = `translateX(-${currentReview * 100}%)`;
    }
    
    // Update dots
    const dots = document.querySelectorAll('.reviews-dot');
    dots.forEach((dot, index) => {
        if (index === currentReview) {
            dot.classList.add('active');
        } else {
            dot.classList.remove('active');
        }
    });
}

function goToReview(index) {
    currentReview = index;
    updateReviewsCarousel();
}

function nextReview() {
    currentReview = (currentReview + 1) % totalReviews;
    updateReviewsCarousel();
}

function prevReview() {
    currentReview = (currentReview - 1 + totalReviews) % totalReviews;
    updateReviewsCarousel();
}

if (reviewsNext) {
    reviewsNext.addEventListener('click', nextReview);
}

if (reviewsPrev) {
    reviewsPrev.addEventListener('click', prevReview);
}

// Auto-play carousel
let carouselInterval;

function startCarousel() {
    carouselInterval = setInterval(nextReview, 5000);
}

function stopCarousel() {
    clearInterval(carouselInterval);
}

if (reviews.length > 0) {
    startCarousel();
    
    // Pause on hover
    const carousel = document.querySelector('.reviews-carousel');
    if (carousel) {
        carousel.addEventListener('mouseenter', stopCarousel);
        carousel.addEventListener('mouseleave', startCarousel);
    }
}

// Smooth Scroll for Navigation Links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            const headerHeight = header.offsetHeight;
            const targetPosition = target.offsetTop - headerHeight;
            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// Contact Form Handler
const contactForm = document.getElementById('contactForm');

if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        // Get form data
        const formData = new FormData(contactForm);
        const name = contactForm.querySelector('input[type="text"]').value;
        const phone = contactForm.querySelector('input[type="tel"]').value;
        const email = contactForm.querySelector('input[type="email"]').value;
        const message = contactForm.querySelector('textarea').value;
        
        // Here you would typically send the data to a server
        console.log('Form submitted:', { name, phone, email, message });
        
        // Show success message
        alert('Спасибо за ваше сообщение! Мы свяжемся с вами в ближайшее время.');
        
        // Reset form
        contactForm.reset();
    });
}

// Intersection Observer for Animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe elements for animation
document.addEventListener('DOMContentLoaded', () => {
    const animateElements = document.querySelectorAll('.catalog-item, .advantage-item, .review-item, .stat-item');
    
    animateElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
});

// Catalog Item Hover Effect
document.querySelectorAll('.catalog-item').forEach(item => {
    item.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-10px) scale(1.02)';
    });
    
    item.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0) scale(1)';
    });
});
