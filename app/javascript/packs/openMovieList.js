const openMovieWheelEvent = (event) => {
  const movieList = document.querySelector(".cinema-movies");
  const MovieListContent =  document.querySelector(".cinema-movies-content");
  // console.log(MovieListContent.scrollTop);
  if (event.deltaY > 0) {
    movieList.classList.add("open");
  } 
  else if (MovieListContent.scrollTop == 0){
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
}

export { openMovieList };