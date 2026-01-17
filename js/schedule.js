document.addEventListener('alpine:init', function () {
  Alpine.data('schedule', function () {
    return {
      async init() {
        await this.fetchEvents()
      },
      async fetchEvents() {
        const req = await fetch('/index.cfm/api/schedule')
        const res = await req.json()
        this.data = res.data
        this.announcements = res.announcements
      },
      format(dateString, f = "datetime") {
        const d = new Date(dateString)
        const date = d.toLocaleString("en-US", {
          weekday: "short",
          year: "numeric",
          month: "short",
          day: "numeric",
        });
        if (f === "date") return date
        const time = d.toLocaleString("en-US", {
          hour: "numeric",
          minute: "2-digit",
        });
        return `${date} @ ${time}`;
      },
      data: [],
      announcements: []
    }
  })
})