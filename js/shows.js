document.addEventListener("alpine:init", function () {
  Alpine.data("shows", function () {
    return {
      async init() {
        await this.fetchShows();
      },
      async fetchShows() {
        const req = await fetch("/index.cfm/api/shows");
        const res = await req.json();
        this.shows = res.data.map((s) => {
          //let cover = new URL(s.cover);
          //console.log(cover);
          //if (cover.protocol === "http") cover.protocol = "https";
          //return { ...s, cover };
          const file = "/shows/" + s.cover.split("/").at(-1);
          const cover = BASE_COVER_URL + file;
          console.log(cover);
          return { ...s, cover };
        });
      },
      q: "",
      shows: [],
      get filteredShows() {
        if (this.q?.length == 0) return this.shows;
        return this.shows.filter((s) =>
          s.name.toLowerCase().includes(this.q.toLowerCase()),
        );
      },
    };
  });
});
