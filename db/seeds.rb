LwCinemaMovie.destroy_all
LwCinemaProjectCategory.destroy_all

aggregator = LwCinemaProjectCategory.create(name: "Aggregator", description: "App aggregating data from other website/API to yield a certain goal")
game = LwCinemaProjectCategory.create(name: "Game", description: "Games or leisure apps")
n_in_one = LwCinemaProjectCategory.create(name: "N-in-one", description: "App doing the function of multiple existing apps in one place")
pro_tool = LwCinemaProjectCategory.create(name: "Pro tool", description: "App improving or simplifying a business process")
rl_assistant = LwCinemaProjectCategory.create(name: "Real Life assistant", description: "App simplifying an everyday task")
teaching = LwCinemaProjectCategory.create(name: "Teaching app", description: "App teaching a skill")
community_manager = LwCinemaProjectCategory.create(name: "Community manager", description: "App improving/managing human interaction in a community")

LwCinemaMovie.create(
  title: "Clever Closet",
  description: "Smaller Closet, Bigger Impact. Using CleverCloset can help reduce your overall carbon footprint.",
  lw_cinema_project_category:rl_assistant,
  youtube_id: "hV3tRDmsq-A?start=215",
  batch: 363
)

LwCinemaMovie.create(
  title: "Kiota",
  description: "No nihongo? No problem, find the perfect place to experience life in Tokyo",
  lw_cinema_project_category:aggregator,
  youtube_id: "hV3tRDmsq-A?start=684",
  batch: 387
)

LwCinemaMovie.create(
  title: "Way to Snow",
  description: "Go find the perfect powder...",
  lw_cinema_project_category:aggregator,
  youtube_id: "hV3tRDmsq-A?start=1397",
  batch: 387
)

LwCinemaMovie.create(
  title: "Clarify",
  description: "Clearing up the mystery surrounding skincare science",
  lw_cinema_project_category:rl_assistant,
  youtube_id: "hV3tRDmsq-A?start=1735",
  batch: 363
)

LwCinemaMovie.create(
  title: "Bokkun",
  description: "Simply Expense",
  lw_cinema_project_category:pro_tool,
  youtube_id: "hV3tRDmsq-A?start=2699",
  batch: 363
)
