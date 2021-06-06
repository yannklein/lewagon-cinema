const openMovieWheelEvent = (event) => {
  const movieList = document.querySelector(".cinema-movies");
  console.log(event);
  if (event.deltaY > 0) {
    movieList.classList.add("open");
  } else {
    movieList.classList.remove("open");
  }
}

const openMovieList = () => {
  const movieMoreBtn = document.querySelector(".cinema-movies-more");
  const movieList = document.querySelector(".cinema-movies");
  movieMoreBtn.addEventListener("click", () => {
    movieList.classList.toggle("open");
  });
  document.addEventListener("wheel", openMovieWheelEvent, true);

  const iframe = document.querySelector('iframe');
  const iframeCover = document.querySelector('.iframe-cover');
  iframe.addEventListener('load', function(){
    iframeCover.addEventListener("mouseover", () => { 
      iframeCover.classList.add('to-the-back');
      // iframe.contentDocument.click();
      console.log('overed', iframe);
    });
    iframe.addEventListener("wheel", () => { 
      console.log('wheeled', iframe);
    }, true);
  });
}

export { openMovieList };