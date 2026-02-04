<cfoutput>
  <form
    x-on:submit="handleSubmit"
    class="mx-auto grid max-w-5xl gap-2"
    x-data="reservation"
    x-init="fetchData"
  >
    <section class="w-full bg-white p-4">
      <div class="grid gap-2 lg:mx-auto lg:max-w-5xl">
        <div class="grid gap-2 lg:grid-cols-3">
          <div class="border-default rounded-base flex border p-4">
            <div class="flex h-5 items-center">
              <input
                checked
                aria-describedby="helper-radio-text"
                type="radio"
                value="school-group"
                class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
              />
            </div>
            <div class="ms-2 text-sm select-none">
              <label for="helper-radio" class="text-heading mb-1 font-medium"
                >School Group</label
              >
              <p id="helper-radio-text" class="text-body text-xs font-normal">
                For public, private and home schols.
              </p>
            </div>
          </div>
          <div
            class="border-default rounded-base bg-disabled flex cursor-not-allowed border p-4"
          >
            <div class="flex h-5 items-center">
              <input
                disabled
                aria-describedby="civic group"
                type="radio"
                class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
              />
            </div>
            <div class="ms-2 text-sm select-none">
              <label
                for="helper-radio"
                class="text-fg-disabled mb-1 font-medium"
                >Civic Group</label
              >
              <p id="helper-radio-text" class="text-body text-xs font-normal">
                Coming online soon!
              </p>
            </div>
          </div>
          <div
            class="border-default rounded-base bg-disabled flex cursor-not-allowed border p-4"
          >
            <div class="flex h-5 items-center">
              <input
                disabled
                id="helper-radio"
                aria-describedby="helper-radio-text"
                type="radio"
                class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
              />
            </div>
            <div class="ms-2 text-sm select-none">
              <label
                for="helper-radio"
                class="text-fg-disabled mb-1 font-medium"
                >Birthday Party</label
              >
              <p id="helper-radio-text" class="text-body text-xs font-normal">
                Coming online soon!
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
      <h5 class="text-xl font-bold">
        Attendance (<span x-text="students + teachers + parents">21</span>/180)
      </h5>
      <div
        x-show="totalAttendance <= 180"
        class="text-fg-brand-strong rounded-base bg-brand-softer p-4 text-sm"
        role="alert"
      >
        <span class="font-medium">We have 180 seats!</span> We do not seat more
        than 180 people.
      </div>
      <div
        x-show="totalAttendance > 180"
        class="text-fg-danger-strong rounded-base bg-danger-soft p-4 text-sm"
        role="alert"
      >
        <span class="font-medium">We have 180 seats!</span> We do not seat more
        than 180 people.
      </div>
      <div class="grid gap-2 lg:grid-cols-3">
        <div
          class="bg-neutral-primary-soft border-default rounded-base hover:bg-neutral-secondary-medium block max-w-sm border p-6 shadow-xs"
        >
          <h5
            x-text="students"
            class="text-heading mb-3 text-center text-5xl leading-8 font-semibold tracking-tight"
          >
            20
          </h5>
          <p class="text-body text-center text-sm">20 minimum required.</p>
          <input
            x-model.number="students"
            id="large-range"
            type="range"
            value="20"
            min="20"
            max="180"
            class="bg-neutral-quaternary range-lg mt-3 h-3 w-full cursor-pointer appearance-none rounded-full"
          />
          <label
            for="large-range"
            class="text-heading mb-2.5 block text-sm font-medium"
            >Students</label
          >
          <div class="flex justify-center gap-2">
            <button
              x-on:click="++students"
              x-bind:disabled="totalAttendance > 180"
              type="button"
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6" />
                <circle cx="10" cy="8" r="5" />
                <path d="M19 16v6" />
                <path d="M22 19h-6" />
              </svg>
              <span class="sr-only">Add 1</span>
            </button>
            <button
              x-on:click="students = 20"
              type="button"
              class="text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 11.873-7" />
                <circle cx="10" cy="8" r="5" />
                <path d="m17 17 5 5" />
                <path d="m22 17-5 5" />
              </svg>
              <span class="sr-only">Reset</span>
            </button>
            <button
              x-on:click="--students"
              x-bind:disabled="students === 20"
              type="button"
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6" />
                <circle cx="10" cy="8" r="5" />
                <path d="M22 19h-6" />
              </svg>
              <span class="sr-only">Subtract 1</span>
            </button>
          </div>
        </div>
        <div
          class="bg-neutral-primary-soft border-default rounded-base hover:bg-neutral-secondary-medium block max-w-sm border p-6 shadow-xs"
        >
          <h5
            x-text="teachers"
            class="text-heading mb-3 text-center text-5xl leading-8 font-semibold tracking-tight"
            x-text="teachers"
          >
            1
          </h5>
          <p class="text-body text-center text-sm">
            minimum of 1 per 10 students
          </p>
          <input
            x-model.number="teachers"
            id="large-range"
            type="range"
            value="20"
            min="1"
            max="180"
            class="bg-neutral-quaternary range-lg mt-3 h-3 w-full cursor-pointer appearance-none rounded-full"
          />
          <label
            for="large-range"
            class="text-heading mb-2.5 block text-sm font-medium"
            >Teachers</label
          >
          <div class="flex justify-center gap-2">
            <button
              x-on:click="++teachers"
              x-bind:disabled="totalAttendance > 180"
              type="button"
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6" />
                <circle cx="10" cy="8" r="5" />
                <path d="M19 16v6" />
                <path d="M22 19h-6" />
              </svg>
              <span class="sr-only">Add 1</span>
            </button>
            <button
              x-on:click="teachers = 1"
              type="button"
              class="text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 11.873-7" />
                <circle cx="10" cy="8" r="5" />
                <path d="m17 17 5 5" />
                <path d="m22 17-5 5" />
              </svg>
              <span class="sr-only">Reset</span>
            </button>
            <button
              x-on:click="--teachers"
              x-bind:disabled="teachers === 1"
              type="button"
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6" />
                <circle cx="10" cy="8" r="5" />
                <path d="M22 19h-6" />
              </svg>
              <span class="sr-only">Subtract 1</span>
            </button>
          </div>
        </div>
        <div
          class="bg-neutral-primary-soft border-default rounded-base hover:bg-neutral-secondary-medium block max-w-sm border p-6 shadow-xs"
        >
          <h5
            x-text="parents"
            class="text-heading mb-3 text-center text-5xl leading-8 font-semibold tracking-tight"
          >
            0
          </h5>
          <p class="text-body text-center text-sm">
            Billed in the school's invoice.
          </p>
          <input
            x-model.number="parents"
            id="large-range"
            type="range"
            value="0"
            min="0"
            max="180"
            class="bg-neutral-quaternary range-lg mt-3 h-3 w-full cursor-pointer appearance-none rounded-full"
          />
          <label
            for="large-range"
            class="text-heading mb-2.5 block text-sm font-medium"
            >Parents</label
          >
          <div class="flex justify-center gap-2">
            <button
              x-on:click="++parents"
              x-bind:disabled="totalAttendance > 180"
              type="button"
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6" />
                <circle cx="10" cy="8" r="5" />
                <path d="M19 16v6" />
                <path d="M22 19h-6" />
              </svg>
              <span class="sr-only">Add 1</span>
            </button>
            <button
              x-on:click="parents = 0"
              type="button"
              class="text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 11.873-7" />
                <circle cx="10" cy="8" r="5" />
                <path d="m17 17 5 5" />
                <path d="m22 17-5 5" />
              </svg>
              <span class="sr-only">Reset</span>
            </button>
            <button
              x-on:click="--parents"
              x-bind:disabled="parents === 0"
              type="button"
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="size-5"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6" />
                <circle cx="10" cy="8" r="5" />
                <path d="M22 19h-6" />
              </svg>
              <span class="sr-only">Subtract 1</span>
            </button>
          </div>
        </div>
      </div>
    </section>
    <section class="w-full bg-white p-4">
      <div class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
        <h5 class="text-xl font-bold" id="date-and-time">Date and Time</h5>
        <div
          class="text-fg-brand-strong rounded-base bg-brand-softer p-4 text-sm"
          role="alert"
        >
          <span class="font-medium">Minimum date is 7 days from today!</span>
          Plan ahead to select a good date.
        </div>
        <div class="grid gap-2 lg:grid-cols-3">
          <div>
            <label
              for="date"
              class="text-heading mb-2.5 block text-sm font-medium"
              >Date <span class="text-red-500">*</span></label
            >
            <input
              x-on:change="onDateChange"
              x-bind:min="minimumDate"
              type="date"
              id="date"
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              placeholder="John"
              required
            />
            <p id="helper-text-explanation" class="text-body mt-2.5 text-sm">
              The date of your event(s), at least 7 days from today.
            </p>
          </div>
        </div>
        <div class="grid gap-2 lg:grid-cols-2">
          <template x-for="(event, i) in events">
            <div class="border-default rounded-base flex border">
              <div class="w-40">
                <img
                  x-bind:src="event.show ? getShow(event).cover : '/themes/MaybornFlowbite/images/image.png'"
                  class="rounded-base h-40 w-full object-cover"
                />
              </div>
              <div class="grid content-center gap-1 p-4">
                <div class="flex items-center">
                  <input
                    x-model="event.checked"
                    x-bind:id="event.date.getTime()"
                    type="checkbox"
                    class="border-default-medium bg-neutral-secondary-medium focus:ring-brand-soft h-4 w-4 rounded-xs border focus:ring-2"
                  />
                  <label
                    x-bind:for="event.date.getTime()"
                    class="text-heading ms-2 text-sm font-medium select-none"
                    x-text="format(event.date)"
                  ></label>
                </div>
                <div class="mt-4">
                  <label
                    x-bind:for="'show-' + i"
                    class="text-heading mb-2.5 block text-sm font-medium"
                    >Select a show</label
                  >
                  <select
                    x-bind:disabled="!event.checked"
                    x-model="event.show"
                    x-bind:id="'show-' + i"
                    class="disabled:text-fg-disabled disabled:bg-disabled bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  >
                    <option selected>Select a show</option>
                    <template x-for="show in shows">
                      <option
                        x-bind:value="JSON.stringify(show)"
                        x-text="`${show.name} [${show.type}]`"
                      >
                        Show Name
                      </option>
                    </template>
                  </select>
                </div>
              </div>
            </div>
          </template>
        </div>
      </div>
    </section>
    <section class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
      <h5 class="py-2 text-xl font-bold" id="postshows">Post Show</h5>
      <div
        class="text-fg-brand-strong rounded-base bg-brand-softer mb-4 p-4 text-sm"
        role="alert"
      >
        <span class="font-medium">Select a post show.</span> Select one of the
        options below.
      </div>
      <div class="grid gap-2 lg:grid-cols-2">
        <div
          class="border-default rounded-base bg-neutral-primary-soft flex border p-4"
        >
          <div class="flex h-5 items-center">
            <input
              x-model="postShow"
              name="postshow"
              id="postShowStarTalk"
              aria-describedby="helper-radio-text"
              type="radio"
              value="Star Talk"
              class="text-neutral-primary bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle border-default h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
            />
          </div>
          <div class="ms-2 text-sm select-none">
            <label for="postShowStarTalk" class="text-heading mb-1 font-medium"
              >Star Talk</label
            >
            <p id="postShowStarTalk" class="text-body text-xs font-normal">
              A tour of the current evening sky showing all the constellations,
              planets and notable stars.
            </p>
          </div>
        </div>
        <div
          class="border-default rounded-base bg-neutral-primary-soft flex border p-4"
        >
          <div class="flex h-5 items-center">
            <input
              x-model="postShow"
              name="postshow"
              id="postShowUniview"
              aria-describedby="helper-radio-text"
              type="radio"
              value="Uniview"
              class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
            />
          </div>
          <div class="ms-2 text-sm select-none">
            <label for="postShowUniview" class="text-heading mb-1 font-medium"
              >Uniview</label
            >
            <p id="helper-radio-text" class="text-body text-xs font-normal">
              A flight through the planets of our solar system, other galaxies
              and beyond.
            </p>
          </div>
        </div>
      </div>
    </section>
    <section class="w-full bg-white p-4">
      <div class="grid gap-2 p-4 lg:mx-auto lg:max-w-5xl">
        <h5 class="text-xl font-bold">Organization Information</h5>
        <div
          class="text-fg-brand-strong rounded-base bg-brand-softer mb-4 p-4 text-sm"
          role="alert"
        >
          <span class="font-medium">Look for your organization below.</span>
          You will find it if your organization has done a field trip with us
          before.
        </div>
        <div>
          <div class="mb-6 grid gap-6 md:grid-cols-2">
            <div>
              <label
                for="query"
                class="text-heading mb-2.5 block text-sm font-medium"
                >Enter the name of your organization</label
              >
              <input
                x-model="query"
                type="text"
                id="query"
                class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                placeholder="Organization Name"
              />
            </div>
            <div class="h-32 overflow-y-auto">
              <div class="grid gap-6">
                <template
                  x-for="{id, name, city, state} in availableOrganizations"
                >
                  <div class="flex">
                    <div class="flex h-5 items-center">
                      <input
                        x-model.number="schoolId"
                        x-bind:id="id + name"
                        type="radio"
                        x-bind:value="id"
                        name="default-radio"
                        class="text-neutral-primary bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle border-default h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
                      />
                    </div>
                    <div class="ms-2 text-sm select-none">
                      <label
                        x-bind:for="id + name"
                        class="text-heading font-medium"
                        x-text="name"
                      ></label>
                      <p
                        id="helper-checkbox-text"
                        class="text-body flex gap-1 text-xs font-normal"
                      >
                        <span x-text="city"></span>
                        <span x-text="state"></span>
                      </p>
                    </div>
                  </div>
                </template>
                <div class="flex">
                  <div class="flex h-5 items-center">
                    <input
                      x-model.number="schoolId"
                      id="no-organization"
                      type="radio"
                      value="0"
                      name="default-radio"
                      class="text-neutral-primary bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle border-default h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
                    />
                  </div>
                  <div class="ms-2 text-sm select-none">
                    <label
                      for="no-organization"
                      class="text-heading font-medium"
                      >My organization is not on the list</label
                    >
                    <p
                      id="helper-checkbox-text"
                      class="text-body text-xs font-normal"
                    >
                      Select this option if you can't find your organization
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <template x-if="schoolId == 0">
          <div>
            <div class="mb-6 grid gap-6 md:grid-cols-2">
              <div class="col-span-2">
                <label
                  for="organization_name"
                  class="text-heading mb-2.5 block text-sm font-medium"
                  >Organization Name</label
                >
                <input
                  x-model="school"
                  type="text"
                  id="organization_name"
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  placeholder="Organization Name"
                  required
                />
              </div>
              <div>
                <label
                  for="organization_address"
                  class="text-heading mb-2.5 block text-sm font-medium"
                  >Address</label
                >
                <input
                  x-model="address"
                  type="text"
                  id="organization_address"
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  placeholder="Address"
                  required
                />
              </div>
              <div>
                <label
                  for="organization_city"
                  class="text-heading mb-2.5 block text-sm font-medium"
                  >City</label
                >
                <input
                  x-model="city"
                  type="text"
                  id="organiation_city"
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  placeholder="City"
                  required
                />
              </div>
              <div>
                <label
                  for="organization_state"
                  class="text-heading mb-2.5 block text-sm font-medium"
                  >State</label
                >
                <input
                  value="Texas"
                  disabled
                  type="text"
                  id="organization_state"
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  placeholder="State"
                  required
                />
              </div>
              <div>
                <label
                  for="organization_zip"
                  class="text-heading mb-2.5 block text-sm font-medium"
                  >ZIP</label
                >
                <input
                  x-model="zip"
                  type="text"
                  minlength="5"
                  maxlength="5"
                  id="organization_zip"
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  placeholder="ZIP"
                  required
                />
              </div>
              <div>
                <label
                  for="organization_phone"
                  class="text-heading mb-2.5 block text-sm font-medium"
                  >Phone</label
                >
                <input
                  x-model="phone"
                  type="phone"
                  minlength="10"
                  maxlength="10"
                  id="organization_phone"
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  placeholder="Phone"
                  required
                />
              </div>
            </div>
          </div>
        </template>
      </div>
    </section>
    <section class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
      <h5 class="py-2 text-xl font-bold">Organizer Information</h5>
      <div>
        <div class="mb-6 grid gap-6 md:grid-cols-2">
          <div>
            <label
              for="firstname"
              class="text-heading mb-2.5 block text-sm font-medium"
              >First Name</label
            >
            <input
              x-model="firstname"
              type="text"
              id="firstname"
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              placeholder="First Name"
              required
            />
          </div>
          <div>
            <label
              for="lastname"
              class="text-heading mb-2.5 block text-sm font-medium"
              >Last Name</label
            >
            <input
              x-model="lastname"
              type="text"
              id="lastname"
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              placeholder="Last Name"
              required
            />
          </div>
          <div>
            <label
              for="email"
              class="text-heading mb-2.5 block text-sm font-medium"
              >Email</label
            >
            <input
              x-model="email"
              type="email"
              id="email"
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              placeholder="Email"
              required
            />
          </div>
          <div>
            <label
              for="phone"
              class="text-heading mb-2.5 block text-sm font-medium"
              >Phone</label
            >
            <input
              x-model="cell"
              minlength="10"
              maxlength="10"
              type="text"
              id="phone"
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              placeholder="Phone"
              required
            />
          </div>
        </div>
      </div>
    </section>
    <section class="w-full bg-white p-4">
      <div class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
        <h5 class="py-2 text-xl font-bold">Overview</h5>
        <div
          x-show="selectedEvents.length <= 0"
          class="text-fg-danger-strong rounded-base bg-danger-soft mb-4 p-4 text-sm"
          role="alert"
        >
          <span class="font-medium"
            >You haven't selected any
            <a class="underline" href="##date-and-time">dates</a> and
            shows!</span
          >
          Select a date, check the desired time slot(s) and the a show from the
          dropdown.
        </div>
        <div
          x-show="postShow.length == 0"
          class="text-fg-danger-strong rounded-base bg-danger-soft mb-4 p-4 text-sm"
          role="alert"
        >
          <span class="font-medium"
            >You haven't selected
            <a class="underline" href="##postshows">post show</a>!</span
          >
          Constellations of the current evening sky our full dome flight around
          planets and galaxies?
        </div>
        <div class="my-2 grid grid-cols-4 gap-2">
          <div class="flex flex-col items-center justify-center">
            <h5 class="flex gap-1 font-bold">
              <span x-text="students"></span>
              <span>students</span>
            </h5>
            <p class="text-body text-sm">Attendance</p>
          </div>
          <div class="flex flex-col items-center justify-center">
            <h5 class="flex gap-1 font-bold">
              <span x-text="teachers"></span>
              <span x-text="teachers === 1 ? 'teacher' : 'teachers'"
                >teacher</span
              >
            </h5>
            <p class="text-body text-sm">Attendance</p>
          </div>
          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold">
              <span x-text="parents"></span>
              <span x-text="parents === 1 ? 'parent' : 'parents'">parents</span>
            </h5>
            <p class="text-body text-sm">Attendance</p>
          </div>
          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold">
              <span x-text="totalAttendance"></span>
              <span>people</span>
            </h5>
            <p class="text-body text-sm">Total</p>
          </div>
        </div>
        <div class="my-2 grid grid-cols-4 gap-2">
          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold">School Group</h5>
            <p class="text-body text-sm">Field Trip Type</p>
          </div>
          <div
            x-show="postShow"
            class="flex flex-col items-center justify-center"
          >
            <h5 class="font-bold" x-text="postShow"></h5>
            <p class="text-body text-sm">Post Show</p>
          </div>
          <div
            x-show="schoolId >= 0"
            class="flex flex-col items-center justify-center"
          >
            <h5
              class="font-bold"
              x-text="schoolId == 0 ? school : selectedOrganization?.name"
            ></h5>
            <p class="text-body text-sm">Organization</p>
          </div>
          <div
            x-show="firstname.length > 0 && lastname.length > 0"
            class="flex flex-col items-center justify-center"
          >
            <h5 class="font-bold" x-text="`${firstname} ${lastname}`"></h5>
            <p class="text-body text-sm">Organizer</p>
          </div>
        </div>
        <div class="grid gap-2 lg:grid-cols-2">
          <template x-for="event in selectedEvents">
            <div
              class="bg-neutral-primary-soft border-default rounded-base flex flex-col items-center border p-6 shadow-xs md:max-w-xl md:flex-row"
            >
              <img
                class="rounded-base mb-4 h-48 w-32 object-cover md:mb-0"
                x-bind:src="getShow(event).cover"
                alt=""
              />
              <div class="flex flex-col justify-between leading-normal md:p-4">
                <h5
                  class="text-heading mb-2 text-xl font-bold tracking-tight"
                  x-text="getShow(event).name"
                ></h5>
                <p
                  class="text-body mb-6 text-sm"
                  x-text="format(event.date)"
                ></p>
                <div>
                  <a
                    href="##date-and-time"
                    type="button"
                    class="text-body bg-neutral-secondary-medium border-default-medium hover:bg-neutral-tertiary-medium hover:text-heading focus:ring-neutral-tertiary rounded-base box-border inline-flex w-auto items-center border px-4 py-2.5 text-sm leading-5 font-medium shadow-xs focus:ring-4 focus:outline-none"
                  >
                    Change
                  </a>
                </div>
              </div>
            </div>
          </template>
        </div>
        <div class="my-2 grid gap-1">
          <label
            for="memo"
            class="text-heading mb-2.5 block text-sm font-medium"
            >Notes (optional)</label
          >
          <textarea
            x-model="memo"
            id="memo"
            rows="4"
            class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border p-3.5 text-sm shadow-xs"
            placeholder="Write anything that will help us with your reservation."
          ></textarea>
        </div>
        <div class="flex justify-end gap-2">
          <button
            x-bind:disabled="!canSubmit"
            type="submit"
            class="disabled:bg-disabled disabled:text-fg-disabled bg-brand hover:bg-brand-strong focus:ring-brand-medium rounded-base box-border cursor-pointer border border-transparent px-4 py-2.5 text-sm leading-5 font-medium text-white shadow-xs focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
          >
            Submit
          </button>
          <button
            type="button"
            class="text-body bg-neutral-primary-soft border-default hover:bg-neutral-secondary-medium hover:text-heading focus:ring-neutral-tertiary-soft rounded-base border px-4 py-2.5 text-sm leading-5 font-medium shadow-xs focus:ring-4 focus:outline-none"
          >
            Start Over
          </button>
        </div>
      </div>
    </section>
  </form>
</cfoutput>
