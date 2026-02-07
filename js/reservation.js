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
      schoolId: undefined,
      events: [],
      postShow: "",
      // New organization
      school: "",
      address: "",
      city: "",
      phone: "",
      // Teacher
      firstname: "",
      lastname: "",
      email: "",
      cell: "",
      state: "Texas",
      zip: "",
      memo: "",
      get isInCapacity() {
        return this.totalAttendance <= 180;
      },
      get canSubmit() {
        if (this.totalAttendance < 20 || this.totalAttendance > 180)
          return false;

        if (this.selectedEvents.length <= 0) return false;

        return true;
      },
      get totalAttendance() {
        return this.students + this.teachers + this.parents;
      },
      get selectedEvents() {
        return this.events.filter((e) => e.checked);
      },
      get availableOrganizations() {
        if (this.query) {
          return this.organizations.filter((o) =>
            o.name.toLowerCase().includes(this.query.toLowerCase()),
          );
        }

        return this.organizations;
      },
      get selectedOrganization() {
        if (this.schoolId > 0)
          return this.organizations.find((o) => o.id == this.schoolId);
        return undefined;
      },
      async onDateChange(e) {
        this.selectedDate = new Date(e.currentTarget.value);

        if ([5, 6].includes(this.selectedDate.getDay())) {
          alert("School Group reservations are not avaialble on weekends.");
          return;
        }

        this.selectedDate.setHours(
          this.selectedDate.getHours() + TIMEZONEOFFSET,
        );

        this.events = [];

        if (this.selectedDate.getTime() < this.minDate.getTime()) {
          alert("The selected date must be at least a week away from today.");
          return;
        }

        const url = new URL("/api/find-available-events", window.location.href);

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
        const req = await fetch(new URL("/api/shows", window.location.href));
        const res = await req.json();
        this.shows = res.data;
      },
      async fetchOrganizations() {
        const req = await fetch(
          new URL("/api/organizations", window.location.href),
        );
        this.organizations = await req.json();
      },
      async fetchData() {
        await this.fetchShows();
        await this.fetchOrganizations();
      },
      getShow(event) {
        if (event.show === undefined) return { name: "", type: "", date: "" };

        const show = JSON.parse(event.show);

        if (show.cover.includes("http")) {
          const url = new URL(show.cover);
          url.protocol = "https";
          show.cover = url.toString();
        }

        return show;
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
      /**
       * @param {Date} date
       */
      formatISO(date) {
        const d = date.toLocaleDateString("en-CA");
        const t = date.toLocaleTimeString("en-GB");
        return d + "T" + t;
      },
      /**
       * @param {Event} e
       */
      async handleSubmit(e) {
        e.preventDefault();

        if (!confirm("Are you sure you want to submit this reservation?"))
          return;

        const url = new URL("/api/create-reservation", window.location.href);

        url.searchParams.append("students", this.students);
        url.searchParams.append("teachers", this.teachers);
        url.searchParams.append("parents", this.parents);
        url.searchParams.append("postShow", this.postShow);
        url.searchParams.append("memo", this.memo);
        url.searchParams.append("specialNeeds", false);
        url.searchParams.append("taxable", true);
        url.searchParams.append("schoolId", this.schoolId);
        url.searchParams.append("school", this.school);
        url.searchParams.append("address", this.address);
        url.searchParams.append("city", this.city);
        url.searchParams.append("phone", this.phone);
        url.searchParams.append("firstname", this.firstname);
        url.searchParams.append("lastname", this.lastname);
        url.searchParams.append("email", this.email);
        url.searchParams.append("cell", this.cell);
        url.searchParams.append("state", "Texas");
        url.searchParams.append("zip", this.zip);

        for (const { date, show } of this.events.filter(
          (event) => event.checked,
        )) {
          url.searchParams.append("show_id", JSON.parse(show).id);
          url.searchParams.append("date", this.formatISO(date));
        }

        const req = await fetch(url);

        const res = await req.json();

        if (req.status > 299) {
          alert(
            "An error occurred trying while submiting your reservation. Please try again in a few minutes.",
          );

          return;
        }

        alert(
          "We have received your reservation request, thank you! We will get back to you within 2 business days.",
        );

        window.location.href = new URL("/", window.location.href);
      },
    };
  });
});
