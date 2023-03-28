const carousel = () => {
  // console.log('Carousel connected!')
  const track = document.querySelector('.carousel-track');
  const slides = Array.from(track.children);
  const prevButton = document.querySelector('.button-left');
  const nextButton = document.querySelector('.button-right');
  const dotsNav = document.querySelector('.carousel-nav');
  const dots = Array.from(dotsNav.children);

  // getBoundingClientRect() gets position and size data for chosen element, like width in this case.
  const slideWidth = slides[0].getBoundingClientRect().width;
  console.log(slideWidth);
  // arrange slides side by side
  const setSlidePosition = (slide, index) => {
    slide.style.left = slideWidth * index + 'px';
  };
  slides.forEach(setSlidePosition)
  // basically doing:
  // slides[0].style.left = slideWidth * 0 + 'px';
  // slides[1].style.left = slideWidth * 1 + 'px';
  // slides[2].style.left = slideWidth * 2 + 'px';

  // METHOD FOR SLIDES
  const moveToSlide = (track, currentSlide, targetSlide) => {
    track.style.transform = 'translateX(-' + targetSlide.style.left + ')';
    currentSlide.classList.remove('current-slide');
    targetSlide.classList.add('current-slide');
  };
  // METHOD FOR DOTS
  const updateDots = (currentDot, targetDot) => {
    currentDot.classList.remove('current-slide');
    targetDot.classList.add('current-slide');
  };

  // METHOD FOR ARROS SHOW/HIDE
  const hideShowArrows = (slides, prevButton, nextButton, targetIndex) => {
    if (targetIndex === 0) {
      prevButton.classList.add('is-hidden')
      nextButton.classList.remove('is-hidden');
    } else if (targetIndex === slides.length - 1) {
      prevButton.classList.remove('is-hidden')
      nextButton.classList.add('is-hidden');
    } else {
      prevButton.classList.remove('is-hidden')
      nextButton.classList.remove('is-hidden');
    }
  };

  // WHEN CLICK LEFT ARROW
  prevButton.addEventListener('click', event => {
    const currentSlide = track.querySelector('.current-slide');
    const prevSlide = currentSlide.previousElementSibling;
    const currentDot = dotsNav.querySelector('.current-slide');
    const prevDot = currentDot.previousElementSibling;
    const prevIndex = slides.findIndex(slide => slide === prevSlide);

    moveToSlide(track, currentSlide, prevSlide);
    updateDots(currentDot, prevDot);
    hideShowArrows(slides, prevButton, nextButton, prevIndex)
  });

  // WHEN CLICK RIGHT ARROW
  nextButton.addEventListener('click', event => {
    const currentSlide = track.querySelector('.current-slide');
    const nextSlide = currentSlide.nextElementSibling;
    const currentDot = dotsNav.querySelector('.current-slide');
    const nextDot = currentDot.nextElementSibling;
    const nextIndex = slides.findIndex(slide => slide === nextSlide);

    moveToSlide(track, currentSlide, nextSlide);
    updateDots(currentDot, nextDot);
    hideShowArrows(slides, prevButton, nextButton, nextIndex)
  });

  // WHEN CLICK NAV DOT
  dotsNav.addEventListener('click', event => {
    const targetDot = event.target.closest('button');

    if (!targetDot) return;

    const currentSlide = track.querySelector('.current-slide');
    const currentDot = dotsNav.querySelector('.current-slide');
    const targetIndex = dots.findIndex(dot => dot === targetDot)
    const targetSlide = slides[targetIndex];

    moveToSlide(track, currentSlide, targetSlide);
    updateDots(currentDot, targetDot);
    hideShowArrows(slides, prevButton, nextButton, targetIndex)
  })
}

// LINK TO CAROUSEL GUIDE
// Part 1 HTML/CSS: https://www.youtube.com/watch?v=VYsVOamdB0g
// Part 2 JS: https://www.youtube.com/watch?v=gBzsE0oieio

export default carousel
