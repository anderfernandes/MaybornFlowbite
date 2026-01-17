document.addEventListener("alpine:init", () => {
  Alpine.data("reservation", () => {
    const TIMEZONEOFFSET = new Date().getTimezoneOffset() / 60;
    const minDate = new Date();
    minDate.setHours(0);
    minDate.setMinutes(0);
    minDate.setSeconds(0);
    minDate.setMilliseconds(0);
    minDate.setDate(minDate.getDate() + 7);
    return {
      students: 20,
      teachers: 2,
      parents: 0,
      shows: [],
      organizations: [],
      schoolId: 0,
      events: [],
      get selectedEvents() {
        return this.events.filter((e) => e.checked);
      },
      get availableOrganizations() {
        if (this.query) {
          const organizations = this.organizations.filter((o) =>
            o.name.toLowerCase().includes(this.query.toLowerCase()),
          );
          organizations.push({
            id: 0,
            name: "My organization is not on the list",
          });
          return organizations;
        }

        return [];
      },
      get selectedOrganization() {
        if (this.schoolId > 0)
          return this.organizations.find((o) => o.id == this.schoolId);
        return undefined;
      },
      async onDateChange(e) {
        this.selectedDate = new Date(e.currentTarget.value);
        this.selectedDate.setHours(
          this.selectedDate.getHours() + TIMEZONEOFFSET,
        );
        //console.log(this.selectedDate.getTime(), this.minDate.getTime());
        if (this.selectedDate.getTime() < this.minDate.getTime()) {
          alert(
            "The selected date must be at least a week away from today.",
          );
          this.events = [];
          return;
        }
        const url = new URL(
          "http://192.168.1.218:8000/api/public/findAvailableEvents",
        );
        url.searchParams.set("date", e.currentTarget.value);

        url.searchParams.set(
          "seats",
          this.students + this.teachers + this.parents,
        );
        const req = await fetch(url);

        const res = await req.json();

        this.events = [];

        for (let i = 0; i < 4; i++) {
          let exists = false;

          const date = new Date(
            this.selectedDate.getFullYear(),
            this.selectedDate.getMonth(),
            this.selectedDate.getDate(),
            9 + i,
            30,
            0,
            0,
          );

          for (item of res.data) {
            const existingDate = new Date(item.start);
            exists = existingDate.getTime() == date.getTime();
          }

          if (!exists)
            this.events.push({
              date,
              checked: false,
            });
        }
      },
      async fetchShows() {
        const url = new URL("http://192.168.1.218:8000/api/shows");
        const req = await fetch(url);
        const res = await req.json();
        this.shows = res.data;
      },
      async fetchOrganizations() {
        const url = new URL("http://192.168.1.218:8000/api/organizations");
        const req = await fetch(url);
        this.organizations = await req.json();
      },
      async fetchData() {
        await this.fetchShows();
        await this.fetchOrganizations();
      },
      getShow(event) {
        if (event.show === undefined)
          return { name: "", type: "", date: "" };
        return JSON.parse(event.show);
      },
      selectedDate: undefined,
      query: "",
      minDate,
      get minimumDate() {
        return this.minDate.toLocaleDateString("en-CA", {
          day: "2-digit",
          month: "2-digit",
          year: "numeric",
        });
      },
      format(d, type = "datetime") {
        const date = d.toLocaleString("en-US", {
          weekday: "short",
          year: "numeric",
          month: "short",
          day: "numeric",
        });
        const time = d.toLocaleString("en-US", {
          hour: "numeric",
          minute: "2-digit",
        });
        return `${date} @ ${time}`;
      },
    };
  });
});