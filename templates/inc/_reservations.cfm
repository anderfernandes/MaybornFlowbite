<cfoutput>
  <p>
    <a href="/"
      ><img
        alt="Mayborn Science Theater Logo"
        class="d-block mx-auto mb-4"
        src="/themes/MaybornFlowbite/images/logo.png"
        style="height: 84px; width: 63px"
    /></a>
  </p>

  <div class="grid gap-4 text-center">
    <h1 class="text-heading mb-4 text-4xl font-bold tracking-tight md:text-5xl">
      Online Reservation Form
    </h1>

    <p class="text-body mb-6 text-lg font-normal sm:px-16 lg:text-xl xl:px-48">
      Make sure you
      <a class="underline" href="/field-trips">read the field trip rules</a>
      beforehand.
    </p>
  </div>

  <form
    class="mx-auto grid gap-2"
    x-data="reservation"
    x-init="fetchData"
    x-on:submit="handleSubmit"
  >
    <section class="w-full bg-white p-4">
      <div class="grid gap-2 lg:mx-auto lg:max-w-5xl">
        <div class="grid gap-2 lg:grid-cols-3">
          <div class="border-default rounded-base flex border p-4">
            <div class="flex h-5 items-center">
              <input
                aria-describedby="helper-radio-text"
                checked="checked"
                class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
                type="radio"
                value="school-group"
              />
            </div>

            <div class="ms-2 text-sm select-none">
              <label class="text-heading mb-1 font-medium" for="helper-radio"
                >School Group</label
              >

              <p class="text-body text-xs font-normal" id="helper-radio-text">
                For public, private and home schols.
              </p>
            </div>
          </div>

          <div
            class="border-default rounded-base bg-disabled flex cursor-not-allowed border p-4"
          >
            <div class="flex h-5 items-center">
              <input
                aria-describedby="civic group"
                class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
                disabled="disabled"
                type="radio"
              />
            </div>

            <div class="ms-2 text-sm select-none">
              <label
                class="text-fg-disabled mb-1 font-medium"
                for="helper-radio"
                >Civic Group</label
              >

              <p class="text-body text-xs font-normal" id="helper-radio-text">
                Coming online soon!
              </p>
            </div>
          </div>

          <div
            class="border-default rounded-base bg-disabled flex cursor-not-allowed border p-4"
          >
            <div class="flex h-5 items-center">
              <input
                aria-describedby="helper-radio-text"
                class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
                disabled="disabled"
                id="helper-radio"
                type="radio"
              />
            </div>

            <div class="ms-2 text-sm select-none">
              <label
                class="text-fg-disabled mb-1 font-medium"
                for="helper-radio"
                >Birthday Party</label
              >

              <p class="text-body text-xs font-normal" id="helper-radio-text">
                Coming online soon!
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--- Attendance --->
    <section class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
      <h5 class="text-xl font-bold">
        Attendance (<span x-text="students + teachers + parents">21</span>/180)
      </h5>

      <div
        class="text-fg-brand-strong rounded-base bg-brand-softer p-4 text-sm"
        role="alert"
        x-show="isInCapacity"
      >
        <span class="font-medium">We have 180 seats!</span> We do not seat more
        than 180 people.
      </div>

      <div
        class="text-fg-danger-strong rounded-base bg-danger-soft p-4 text-sm"
        role="alert"
        x-show="!isInCapacity"
      >
        <span class="font-medium">We have 180 seats!</span> We do not seat more
        than 180 people.
      </div>

      <div class="grid gap-2 lg:grid-cols-3">
        <div
          class="bg-neutral-primary-soft border-default rounded-base hover:bg-neutral-secondary-medium block border p-6 shadow-xs"
        >
          <h5
            class="text-heading mb-3 text-center text-5xl leading-8 font-semibold tracking-tight"
            x-text="students"
          >
            20
          </h5>

          <p class="text-body text-center text-sm">20 minimum required.</p>
          <input
            class="bg-neutral-quaternary range-lg mt-3 h-3 w-full cursor-pointer appearance-none rounded-full"
            id="range-students"
            max="180"
            min="20"
            type="range"
            value="20"
            x-model.number="students"
          />
          <label
            class="text-heading mb-2.5 block text-sm font-medium"
            for="range-students"
            >Students</label
          >

          <div class="flex justify-center gap-2">
            <button
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
              type="button"
              x-bind:disabled="!isInCapacity"
              x-on:click="++students"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="M19 16v6"></path>
                <path d="M22 19h-6"></path>
              </svg>
              <span class="sr-only">Add 1</span></button
            ><button
              class="text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none"
              type="button"
              x-on:click="students = 20"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 11.873-7"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="m17 17 5 5"></path>
                <path d="m22 17-5 5"></path>
              </svg>
              <span class="sr-only">Reset</span></button
            ><button
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
              type="button"
              x-bind:disabled="students === 20"
              x-on:click="--students"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="M22 19h-6"></path>
              </svg>
              <span class="sr-only">Subtract 1</span>
            </button>
          </div>
        </div>

        <div
          class="bg-neutral-primary-soft border-default rounded-base hover:bg-neutral-secondary-medium block border p-6 shadow-xs"
        >
          <h5
            class="text-heading mb-3 text-center text-5xl leading-8 font-semibold tracking-tight"
            x-text="teachers"
          >
            1
          </h5>

          <p class="text-body text-center text-sm">
            minimum of 1 per 10 students
          </p>
          <input
            class="bg-neutral-quaternary range-lg mt-3 h-3 w-full cursor-pointer appearance-none rounded-full"
            id="large-range"
            max="180"
            min="1"
            type="range"
            value="20"
            x-model.number="teachers"
          />
          <label
            class="text-heading mb-2.5 block text-sm font-medium"
            for="large-range"
            >Teachers</label
          >

          <div class="flex justify-center gap-2">
            <button
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
              type="button"
              x-bind:disabled="!isInCapacity"
              x-on:click="++teachers"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="M19 16v6"></path>
                <path d="M22 19h-6"></path>
              </svg>
              <span class="sr-only">Add 1</span></button
            ><button
              class="text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none"
              type="button"
              x-on:click="teachers = 1"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 11.873-7"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="m17 17 5 5"></path>
                <path d="m22 17-5 5"></path>
              </svg>
              <span class="sr-only">Reset</span></button
            ><button
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
              type="button"
              x-bind:disabled="teachers === 1"
              x-on:click="--teachers"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="M22 19h-6"></path>
              </svg>
              <span class="sr-only">Subtract 1</span>
            </button>
          </div>
        </div>

        <div
          class="bg-neutral-primary-soft border-default rounded-base hover:bg-neutral-secondary-medium block border p-6 shadow-xs"
        >
          <h5
            class="text-heading mb-3 text-center text-5xl leading-8 font-semibold tracking-tight"
            x-text="parents"
          >
            0
          </h5>

          <p class="text-body text-center text-sm">
            Billed in the school's invoice.
          </p>
          <input
            class="bg-neutral-quaternary range-lg mt-3 h-3 w-full cursor-pointer appearance-none rounded-full"
            id="large-range"
            max="180"
            min="0"
            type="range"
            value="0"
            x-model.number="parents"
          />
          <label
            class="text-heading mb-2.5 block text-sm font-medium"
            for="large-range"
            >Parents</label
          >

          <div class="flex justify-center gap-2">
            <button
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
              type="button"
              x-bind:disabled="!isInCapacity"
              x-on:click="++parents"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="M19 16v6"></path>
                <path d="M22 19h-6"></path>
              </svg>
              <span class="sr-only">Add 1</span></button
            ><button
              class="text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none"
              type="button"
              x-on:click="parents = 0"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 11.873-7"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="m17 17 5 5"></path>
                <path d="m22 17-5 5"></path>
              </svg>
              <span class="sr-only">Reset</span></button
            ><button
              class="disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled text-fg-brand bg-neutral-primary border-brand hover:bg-brand focus:ring-brand-subtle rounded-base inline-flex h-10 w-10 cursor-pointer items-center justify-center border hover:text-white focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
              type="button"
              x-bind:disabled="parents === 0"
              x-on:click="--parents"
            >
              <svg
                class="size-5"
                fill="none"
                height="24"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                viewbox="0 0 24 24"
                width="24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path d="M2 21a8 8 0 0 1 13.292-6"></path>
                <circle cx="10" cy="8" r="5"></circle>
                <path d="M22 19h-6"></path>
              </svg>
              <span class="sr-only">Subtract 1</span>
            </button>
          </div>
        </div>
      </div>
    </section>
    <!--- Date and Time --->
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
              class="text-heading mb-2.5 block text-sm font-medium"
              for="date"
              >Date <span class="text-red-500">*</span></label
            >
            <input
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              id="date"
              placeholder="John"
              required=""
              type="date"
              x-bind:min="minimumDate"
              x-on:change="onDateChange"
            />
            <p class="text-body mt-2.5 text-sm" id="helper-text-explanation">
              The date of your event(s), at least 7 days from today.
            </p>
          </div>
        </div>

        <div class="grid gap-2 lg:grid-cols-2">
          <template x-for="(event, i) in events">
            <div class="border-default rounded-base flex border">
              <div class="w-40">
                <img
                  class="rounded-base h-40 w-full object-cover"
                  x-bind:src="event.show ? getShow(event).cover : '/themes/MaybornFlowbite/images/image.png'"
                />
              </div>

              <div class="grid content-center gap-1 p-4">
                <div class="flex items-center">
                  <input
                    class="border-default-medium bg-neutral-secondary-medium focus:ring-brand-soft h-4 w-4 rounded-xs border focus:ring-2"
                    type="checkbox"
                    x-bind:id="event.date.getTime()"
                    x-model="event.checked"
                  />
                  <label
                    class="text-heading ms-2 text-sm font-medium select-none"
                    x-bind:for="event.date.getTime()"
                    x-text="format(event.date)"
                    >Event</label
                  >
                </div>

                <div class="mt-4">
                  <label
                    class="text-heading mb-2.5 block text-sm font-medium"
                    x-bind:for="'show-' + i"
                    >Select a show</label
                  >
                  <select
                    class="disabled:text-fg-disabled disabled:bg-disabled bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                    x-bind:disabled="!event.checked"
                    x-bind:id="'show-' + i"
                    x-model="event.show"
                  >
                    <option selected="selected">Select a show</option>
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
    <!--- Post Show --->
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
              aria-describedby="helper-radio-text"
              class="text-neutral-primary bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle border-default h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
              id="postShowStarTalk"
              name="postshow"
              type="radio"
              value="Star Talk"
              x-model="postShow"
            />
          </div>

          <div class="ms-2 text-sm select-none">
            <label class="text-heading mb-1 font-medium" for="postShowStarTalk"
              >Star Talk</label
            >

            <p class="text-body text-xs font-normal" id="postShowStarTalk">
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
              aria-describedby="helper-radio-text"
              class="text-neutral-primary border-default-medium bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
              id="postShowUniview"
              name="postshow"
              type="radio"
              value="Uniview"
              x-model="postShow"
            />
          </div>

          <div class="ms-2 text-sm select-none">
            <label class="text-heading mb-1 font-medium" for="postShowUniview"
              >Uniview</label
            >

            <p class="text-body text-xs font-normal" id="helper-radio-text">
              A flight through the planets of our solar system, other galaxies
              and beyond.
            </p>
          </div>
        </div>
      </div>
    </section>
    <!--- Organization --->
    <section class="w-full bg-white p-4">
      <div class="grid gap-2 p-4 lg:mx-auto lg:max-w-5xl">
        <h5 class="text-xl font-bold">Organization Information</h5>

        <div
          class="text-fg-brand-strong rounded-base bg-brand-softer mb-4 p-4 text-sm"
          role="alert"
        >
          <span class="font-medium">Look for your organization below.</span> You
          will find it if your organization has done a field trip with us
          before.
        </div>

        <div>
          <div class="mb-6 grid gap-6 md:grid-cols-2">
            <div>
              <label
                class="text-heading mb-2.5 block text-sm font-medium"
                for="query"
                >Enter the name of your organization</label
              >
              <input
                class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                id="query"
                placeholder="Organization Name"
                type="text"
                x-model="query"
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
                        class="text-neutral-primary bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle border-default h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
                        name="default-radio"
                        type="radio"
                        x-bind:id="id + name"
                        x-bind:value="id"
                        x-model.number="schoolId"
                      />
                    </div>

                    <div class="ms-2 text-sm select-none">
                      <label
                        class="text-heading font-medium"
                        x-bind:for="id + name"
                        x-text="name"
                        >Organization</label
                      >

                      <p
                        class="text-body flex gap-1 text-xs font-normal"
                        id="helper-checkbox-text"
                      >
                        <span x-text="city">City</span>
                        <span x-text="state">State</span>
                      </p>
                    </div>
                  </div>
                </template>
                <div class="flex">
                  <div class="flex h-5 items-center">
                    <input
                      class="text-neutral-primary bg-neutral-secondary-medium checked:border-brand focus:ring-brand-subtle border-default h-4 w-4 appearance-none rounded-full border focus:ring-2 focus:outline-none"
                      id="no-organization"
                      name="default-radio"
                      type="radio"
                      value="0"
                      x-model.number="schoolId"
                    />
                  </div>

                  <div class="ms-2 text-sm select-none">
                    <label
                      class="text-heading font-medium"
                      for="no-organization"
                      >My organization is not on the list</label
                    >

                    <p
                      class="text-body text-xs font-normal"
                      id="helper-checkbox-text"
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
                  class="text-heading mb-2.5 block text-sm font-medium"
                  for="organization_name"
                  >Organization Name</label
                >
                <input
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  id="organization_name"
                  placeholder="Organization Name"
                  required=""
                  type="text"
                  x-model="school"
                />
              </div>

              <div>
                <label
                  class="text-heading mb-2.5 block text-sm font-medium"
                  for="organization_address"
                  >Address</label
                >
                <input
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  id="organization_address"
                  placeholder="Address"
                  required=""
                  type="text"
                  x-model="address"
                />
              </div>

              <div>
                <label
                  class="text-heading mb-2.5 block text-sm font-medium"
                  for="organization_city"
                  >City</label
                >
                <input
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  id="organiation_city"
                  placeholder="City"
                  required=""
                  type="text"
                  x-model="city"
                />
              </div>

              <div>
                <label
                  class="text-heading mb-2.5 block text-sm font-medium"
                  for="organization_state"
                  >State</label
                >
                <input
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  disabled="disabled"
                  id="organization_state"
                  placeholder="State"
                  required=""
                  type="text"
                  value="Texas"
                />
              </div>

              <div>
                <label
                  class="text-heading mb-2.5 block text-sm font-medium"
                  for="organization_zip"
                  >ZIP</label
                >
                <input
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  id="organization_zip"
                  maxlength="5"
                  minlength="5"
                  placeholder="ZIP"
                  required=""
                  type="text"
                  x-model="zip"
                />
              </div>

              <div>
                <label
                  class="text-heading mb-2.5 block text-sm font-medium"
                  for="organization_phone"
                  >Phone</label
                >
                <input
                  class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
                  id="organization_phone"
                  maxlength="10"
                  minlength="10"
                  placeholder="Phone"
                  required=""
                  type="phone"
                  x-model="phone"
                />
              </div>
            </div>
          </div>
        </template>
      </div>
    </section>
    <!--- Organizer --->
    <section class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
      <h5 class="py-2 text-xl font-bold">Organizer Information</h5>

      <div>
        <div class="mb-6 grid gap-6 md:grid-cols-2">
          <div>
            <label
              class="text-heading mb-2.5 block text-sm font-medium"
              for="firstname"
              >First Name</label
            >
            <input
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              id="firstname"
              placeholder="First Name"
              required=""
              type="text"
              x-model="firstname"
            />
          </div>

          <div>
            <label
              class="text-heading mb-2.5 block text-sm font-medium"
              for="lastname"
              >Last Name</label
            >
            <input
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              id="lastname"
              placeholder="Last Name"
              required=""
              type="text"
              x-model="lastname"
            />
          </div>

          <div>
            <label
              class="text-heading mb-2.5 block text-sm font-medium"
              for="email"
              >Email</label
            >
            <input
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              id="email"
              placeholder="Email"
              required=""
              type="email"
              x-model="email"
            />
          </div>

          <div>
            <label
              class="text-heading mb-2.5 block text-sm font-medium"
              for="phone"
              >Phone</label
            >
            <input
              class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border px-3 py-2.5 text-sm shadow-xs"
              id="phone"
              maxlength="10"
              minlength="10"
              placeholder="Phone"
              required=""
              type="text"
              x-model="cell"
            />
          </div>
        </div>
      </div>
    </section>
    <!--- Overview --->
    <section class="w-full bg-white p-4">
      <div class="grid w-full gap-2 p-4 lg:mx-auto lg:max-w-5xl">
        <h5 class="py-2 text-xl font-bold">Overview</h5>

        <div
          class="text-fg-danger-strong rounded-base bg-danger-soft mb-4 p-4 text-sm"
          role="alert"
          x-show="selectedEvents.length &lt;= 0"
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
          class="text-fg-danger-strong rounded-base bg-danger-soft mb-4 p-4 text-sm"
          role="alert"
          x-show="postShow.length == 0"
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
              <span x-text="students">20</span> <span>students</span>
            </h5>

            <p class="text-body text-sm">Attendance</p>
          </div>

          <div class="flex flex-col items-center justify-center">
            <h5 class="flex gap-1 font-bold">
              <span x-text="teachers">2</span>
              <span x-text="teachers === 1 ? 'teacher' : 'teachers'"
                >teacher</span
              >
            </h5>

            <p class="text-body text-sm">Attendance</p>
          </div>

          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold">
              <span x-text="parents">0</span>
              <span x-text="parents === 1 ? 'parent' : 'parents'">parents</span>
            </h5>

            <p class="text-body text-sm">Attendance</p>
          </div>

          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold">
              <span x-text="totalAttendance">22</span> <span>people</span>
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
            class="flex flex-col items-center justify-center"
            x-show="postShow"
          >
            <h5 class="font-bold" x-text="postShow">Uniview or Startalk</h5>

            <p class="text-body text-sm">Post Show</p>
          </div>

          <div
            class="flex flex-col items-center justify-center"
            x-show="schoolId &gt;= 0"
          >
            <h5
              class="font-bold"
              x-text="schoolId == 0 ? school : selectedOrganization?.name"
            >
               
            </h5>

            <p class="text-body text-sm">Organization</p>
          </div>

          <div
            class="flex flex-col items-center justify-center"
            x-show="firstname.length &gt; 0 &amp;&amp; lastname.length &gt; 0"
          >
            <h5 class="font-bold" x-text="`${firstname} ${lastname}`">
              Organizer Name
            </h5>

            <p class="text-body text-sm">Organizer</p>
          </div>
        </div>

        <div class="grid gap-2 lg:grid-cols-2">
          <template x-for="event in selectedEvents">
            <div
              class="bg-neutral-primary-soft border-default rounded-base flex flex-col items-center border p-6 shadow-xs md:max-w-xl md:flex-row"
            >
              <img
                alt=""
                class="rounded-base mb-4 h-48 w-32 object-cover md:mb-0"
                x-bind:src="getShow(event).cover"
              />
              <div class="flex flex-col justify-between leading-normal md:p-4">
                <h5
                  class="text-heading mb-2 text-xl font-bold tracking-tight"
                  x-text="getShow(event).name"
                >
                  Show Name
                </h5>

                <p class="text-body mb-6 text-sm" x-text="format(event.date)">
                  Date
                </p>

                <div>
                  <a
                    class="text-body bg-neutral-secondary-medium border-default-medium hover:bg-neutral-tertiary-medium hover:text-heading focus:ring-neutral-tertiary rounded-base box-border inline-flex w-auto items-center border px-4 py-2.5 text-sm leading-5 font-medium shadow-xs focus:ring-4 focus:outline-none"
                    href="##date-and-time"
                    type="button"
                    >Change
                  </a>
                </div>
              </div>
            </div>
          </template>
        </div>

        <div class="my-2 grid gap-1">
          <label
            class="text-heading mb-2.5 block text-sm font-medium"
            for="memo"
            >Notes (optional)</label
          ><textarea
            class="bg-neutral-secondary-medium border-default-medium text-heading rounded-base focus:ring-brand focus:border-brand placeholder:text-body block w-full border p-3.5 text-sm shadow-xs"
            id="memo"
            placeholder="Write anything that will help us with your reservation."
            rows="4"
            x-model="memo"
          ></textarea>
        </div>

        <div class="flex justify-end gap-2">
          <button
            class="disabled:bg-disabled disabled:text-fg-disabled bg-brand hover:bg-brand-strong focus:ring-brand-medium rounded-base box-border cursor-pointer border border-transparent px-4 py-2.5 text-sm leading-5 font-medium text-white shadow-xs focus:ring-4 focus:outline-none disabled:cursor-not-allowed"
            type="submit"
            x-bind:disabled="!canSubmit"
          >
            Submit</button
          ><button
            class="text-body bg-neutral-primary-soft border-default hover:bg-neutral-secondary-medium hover:text-heading focus:ring-neutral-tertiary-soft rounded-base border px-4 py-2.5 text-sm leading-5 font-medium shadow-xs focus:ring-4 focus:outline-none"
            type="button"
          >
            Start Over
          </button>
        </div>
      </div>
    </section>
  </form>
  <script src="#$.siteConfig('themeAssetPath')#/js/reservation.js"></script>
</cfoutput>
