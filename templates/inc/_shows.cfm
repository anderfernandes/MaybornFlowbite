<cfoutput>
  <section class="grid content-start gap-4" x-data="shows">
    <div class="mb-2 grid gap-2 md:grid-cols-3">
      <div>
        <label
          for="search"
          class="sr-only mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Search</label
        >
        <div class="relative">
          <div
            class="pointer-events-none absolute inset-y-0 start-0 flex items-center ps-3"
          >
            <svg
              class="text-body h-4 w-4"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              fill="none"
              viewBox="0 0 24 24"
            >
              <path
                stroke="currentColor"
                stroke-linecap="round"
                stroke-width="2"
                d="m21 21-3.5-3.5M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Z"
              />
            </svg>
          </div>
          <input
            x-model="q"
            type="search"
            id="search"
            class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border p-3 ps-9 text-sm shadow-xs"
            placeholder="Search"
            required
          />
        </div>
      </div>
    </div>
    <div class="grid gap-2 md:grid-cols-3">
      <template x-for="show in filteredShows">
        <a
          x-bind:href="`/shows?id=${show.id}`"
          class="border-default h-48 flex-none rounded border shadow-xs hover:bg-gray-50"
        >
          <div class="flex">
            <img
              class="w-32 rounded"
              x-bind:src="show.cover"
              src="/themes/MaybornFlowbite/images/image.png"
            />
            <div class="m-4 grid grow content-start gap-2">
              <h3 x-text="show.name" class="text-lg font-extrabold">
                Show Name
              </h3>
              <div class="flex gap-2">
                <span
                  class="ring-brand-subtle text-fg-brand-strong bg-brand-softer inline-flex items-center rounded px-2 py-1 text-sm font-medium ring-1 ring-inset"
                  x-text="show.type"
                  >Show Type</span
                >
              </div>
            </div>
          </div>
        </a>
      </template>
    </div>
  </section>
  <script src="#$.siteConfig('themeAssetPath')#/js/shows.js"></script>
</cfoutput>
