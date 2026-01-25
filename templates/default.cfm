<cfoutput>
<!doctype html>
<html lang="en">
  <head>
    <cfinclude template="inc/html_head.cfm" />
  </head>
  <body style="margin-top:64px">
    <cfinclude template="inc/navbar.cfm" />
    <section class="h-[calc(100vh-60px)] w-full flex flex-col items-center justify-center text-center px-4" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('#$.siteConfig('themeAssetPath')#/images/cover.jpg');background-size:cover;background-position:bottom">
      <h1 class="mb-4 text-4xl font-bold text-white tracking-tight md:text-5xl lg:text-6xl">
        Welcome to our universe!
      </h1>
      <p class="mb-6 text-lg font-normal text-gray-400 lg:text-xl sm:px-16 xl:px-48">
        We are located on the campus of Central Texas College in Kileen, Texas.
      </p>
      <div>
        <a href="/" class="inline-flex items-center text-white bg-brand box-border border border-transparent hover:bg-brand-strong focus:ring-4 focus:ring-brand-medium shadow-xs font-medium leading-5 rounded-base text-base px-5 py-3 focus:outline-none">Learn more</a>
      </div>
    </section>
    <main class="mx-auto max-w-7xl py-4 grid content-start gap-4 px-4">
      <h1 class="text-4xl text-center font-extrabold pt-4">Schedule</h1>
      <p class="text-center lg:mx-48 text-body text-lg">
        We are located at the campus of Central Texas College in Killeen, Texas. Below you will see a list of events happening within the next 30 days. If you have any questions, on weekdays, call 254-526-1768. On weekends, call 254-526-1799.
      </p>
      <hr class="h-px bg-neutral-quaternary border-0">
      <div x-data="schedule">
        <template x-for="{ date, events } in data">
          <div class="grid gap-4 content-start">
            <h4 class="text-2xl font-bold text-heading flex">
              <span class="mr-1" x-text="format(date, 'date')">Date</span>
              (<span class="mr-1" x-text="events.length">0</span> events)
            </h4>
            <div class="flex gap-2 w-full pt-0 pb-2 md:py-4 md:px-4 overflow-x-auto">
              <template x-for="event in events">
                <a x-bind:href="`/events?id=${event.id}`" class="flex-none rounded w-56 h-104 border border-default shadow-xs md:hover:scale-105">
                  <div class="flex flex-col">
                    <h5 class="font-extrabold text-lg p-4 truncate" x-text="event.show.name">
                    </h5>
                    <img class="h-64 object-cover" x-bind:src="event.show.cover" />
                    <div class="grid gap-2 content-start m-4">
                      <p class="text-body text-sm" x-text="format(event.start)">
                        Event Date and Time
                      </p>
                      <div class="flex gap-2">
                        <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-brand-subtle text-fg-brand-strong text-sm font-medium rounded bg-brand-softer" x-text="event.show.type">Show Type</span>
                        <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-default text-heading text-sm font-medium rounded bg-neutral-primary-soft" x-text="event.type.name">Event Type</span>
                      </div>
                    </div>
                  </div>
                </a>
              </template>
            </div>
          </div>
        </template>
      </div>
      <div class="flex items-start sm:items-center p-4 mb-4 text-sm text-fg-brand-strong rounded-base bg-brand-softer" role="alert">
        <svg class="w-4 h-4 me-2 shrink-0 mt-0.5 sm:mt-0" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 11h2v5m-2 0h4m-2.592-8.5h.01M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/>
        </svg>
        <p>
          <span class="font-medium me-1">We are working to bring you online ticket sales!</span> 
          In the meantime, if the event details page says we have seats, we can sit you and your family.
        </p>
      </div>
      <div x-data="shows">
        <div class="grid gap-2 md:grid-cols-3 mb-2">
          <div>   
              <label for="search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
              <div class="relative">
                  <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                      <svg class="w-4 h-4 text-body" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="m21 21-3.5-3.5M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Z"/></svg>
                  </div>
                  <input x-model="q" type="search" id="search" class="block w-full p-3 ps-9 bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand shadow-xs placeholder:text-body" placeholder="Search" required />
              </div>
            </div>
        </div>
        <div class="grid md:grid-cols-3 gap-2">
          <template x-for="show in filteredShows">
            <a x-bind:href="`/shows?id=${show.id}`" class="flex-none rounded h-48 border border-default shadow-xs hover:bg-gray-50">
              <div class="flex">
                <img class="rounded w-32" x-bind:src="show.cover" />
                <div class="grid gap-2 content-start m-4 grow">
                  <h3 x-text="show.name" class="font-extrabold text-lg">Show Name</h3>
                  <div class="flex gap-2">
                    <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-brand-subtle text-fg-brand-strong text-sm font-medium rounded bg-brand-softer" x-text="show.type">Show Type</span>
                  </div>
                </div>
              </div>
            </a>
          </template>
        </div>
      </div>
      <div class="grid md:grid-cols-3 gap-2">
        <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
          <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8">Matinees</h5>
          <p class="text-body">$5 all ages</p>
          <p class="text-body">Under 3 years old are free</p>
          <p class="text-body">Members are FREE!</p>
        </div>
        <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
          <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8">Weekends</h5>
          <p class="text-body">$7 adults</p>
          <p class="text-body">$6 kids under 12</p>
          <p class="text-body">Under 3 years old are free</p>
          <p class="text-body">Members are FREE!</p>
          <p class="text-body">Special Event prices may be higher.</p>
        </div>
        <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
          <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8">Laser Friday</h5>
          <p class="text-body">$7 adults</p>
          <p class="text-body">$6 kids under 12</p>
          <p class="text-body">Under 3 years old are free</p>
          <p class="text-body">Members are FREE!</p>
        </div>
        <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
          <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8">School Groups</h5>
          <div class="text-body">
            <ul class="list-disc list-outside ml-4">
              <li>$5 per ticket</li>
              <li>20% discount if two or more shows are booked for the same day ($8 for 2 shows, $12 for 3 shows). Each show is booked for 1 hour, 2 shows would be 2 hours, and 3 shows would be 3 hours.</li>
              <li>Exclusive access to the theater for your event and show of your choosing. 20 minimum tickets to book a reservation for one hour. Maximum 180 seats in the theater. </li>
              <li>No discounts, coupons, free passes or promos for school groups. Member discount not included for private reservations.</li>
              <li>For every 10 students, one teacher is free. Chaperones count as a teacher only when approved by the school and in charge of a group of students. Students are to be with an adult at all times.</li>
              <li>Groups with less than 20 may get group price by booking a regularly scheduled public show.</li>
              <li>Lunch space is available outside the building in the courtyard. All trash must be collected and bagged for disposal.</li>
            </ul>
          </div>
          <button type="button" class="text-white bg-brand box-border border border-transparent mt-4 hover:bg-brand-strong focus:ring-4 focus:ring-brand-medium shadow-xs font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">More Info</button>
        </div>
        <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
          <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8">Civic Groups</h5>
          <div class="text-body">
            <ul class="list-disc list-outside ml-4">
              <li>$5 per ticket</li>
              <li>Exclusive access to the theater for your event and show of your choosing. 50 minimum people to book a reservation for one hour. Maximum 85 people for party space.</li>
              <li>Civic group reservations include 1 hour in the theater and 1 hour in the planetarium party space.</li>
              <li>No discounts, coupons, free passes or other promos. Member discount not included for private reservations. </li>
              <li>Events booked on Saturday's must choose their show from the set schedule.</li>
              <li>Catering available from CTC's exclusive caterer at extra charge.</li>
              <li>Other conditions may apply</li>
            </ul>
          </div>
          <button type="button" class="text-white bg-brand box-border border border-transparent mt-4 hover:bg-brand-strong focus:ring-4 focus:ring-brand-medium shadow-xs font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">More Info</button>
        </div>
        <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
          <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8">Birthday Parties</h5>
          <div class="text-body">
            <ul class="list-disc list-outside ml-4">
              <li>All packages require a minimum of 15 paid tickets.</li>
              <li>Deluxe Party: $8 per ticket. 2 hour party includes 1 show and 1 hour private party space.</li>
              <li>Ultimate Party: $12 per ticket. 3 hour party includes 2 shows and 1 hour private party space OR 1 show and 2 hours private party space.</li>
              <li>Parties can only be booked on Saturday and must choose a show from the set schedule. Theater will be open to the public during show times, party attendees are first to be seated.</li>
              <li>All parties include a birthday laser song and name on the dome!</li>
              <li>Members pay half-price on all packages (friend membership does not qualify for discount).</li>
              <li>Other conditions may apply</li>
            </ul>
          </div>
          <button type="button" class="text-white bg-brand box-border border border-transparent mt-4 hover:bg-brand-strong focus:ring-4 focus:ring-brand-medium shadow-xs font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">More Info</button>
        </div>
      </div>
      <h1 class="text-4xl text-center font-extrabold pt-4">Discounts</h1>
      <div class="grid md:grid-cols-2 gap-2">
        <div class="bg-neutral-primary-soft block p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
            <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8">Member Discounts</h5>
            <p class="text-body">FREE ADMISSION to matinees</p>
            <p class="text-body">FREE ADMISSION to weekend shows</p>
            <p class="text-body">FREE ADMISSION to Laser Friday shows</p>
            <p class="text-body">50% OFF birthday parties</p>
            <p class="text-body">Discounts on most special event</p>
        </div>
        <div class="bg-neutral-primary-soft block p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
            <h5 class="mb-3 text-2xl font-semibold tracking-tight text-heading leading-8"><a href="/">ASTC</a> Member Discounts</h5>
            <p class="text-body">FREE ADMISSION to matinees</p>
            <p class="text-body">FREE ADMISSION to weekend shows</p>
            <p class="text-body">FREE ADMISSION to Laser Friday shows</p>
            <p class="text-body">50% OFF birthday parties</p>
            <p class="text-body">No discounts for special events</p>
        </div>
      </div>
      <section class="bg-white dark:bg-gray-900">
        <div class="py-8 px-4 mx-auto max-w-7xl sm:py-16 lg:px-6">
          <div class="max-w-3xl mb-8 lg:mb-16">
              <h2 class="mb-4 text-4xl tracking-tight font-extrabold text-gray-900 dark:text-white">Scheduling a field trip is simple and fast!</h2>
              <p class="text-gray-500 sm:text-xl dark:text-gray-400">You send us your group information and you will get a confirmation within 2 business days.</p>
          </div>
          <div class="space-y-8 md:grid md:grid-cols-2 lg:grid-cols-3 md:gap-12 md:space-y-0">
              <div>
                  <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-lg bg-brand text-white lg:h-12 lg:w-12 dark:bg-primary-900">
                    <svg viewBox="0 0 24 24" style="height: 240px; width: 240px;"><path fill="currentColor" d="M10,7V9H12V17H14V7H10Z"></path></svg>
                  </div>
                  <h3 class="mb-2 text-xl font-bold dark:text-white">Choose a Group Leader</h3>
                  <p class="text-gray-500 dark:text-gray-400">This person will be responsible for the field trip.</p>
              </div>
              <div>
                  <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-lg bg-brand text-white lg:h-12 lg:w-12 dark:bg-primary-900">
                    <svg viewBox="0 0 24 24" style="height: 240px; width: 240px;"><path fill="currentColor" d="M9,7V9H13V11H11A2,2 0 0,0 9,13V17H11L15,17V15H11V13H13A2,2 0 0,0 15,11V9A2,2 0 0,0 13,7H9Z"></path></svg>
                  </div>
                  <h3 class="mb-2 text-xl font-bold dark:text-white">Look at our show options</h3>
                  <p class="text-gray-500 dark:text-gray-400"><a class="text-brand underline" href="/">Look at our show catalog</a> and see what show(s) would be good for your group.</p>
              </div>
              <div>
                  <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-lg bg-brand text-white lg:h-12 lg:w-12 dark:bg-primary-900">
                    <svg viewBox="0 0 24 24" style="height: 240px; width: 240px;"><path fill="currentColor" d="M15,15V13.5A1.5,1.5 0 0,0 13.5,12A1.5,1.5 0 0,0 15,10.5V9C15,7.89 14.1,7 13,7H9V9H13V11H11V13H13V15H9V17H13A2,2 0 0,0 15,15"></path></svg>
                  </div>
                  <h3 class="mb-2 text-xl font-bold dark:text-white">We seat 180 people maximum</h3>
                  <p class="text-gray-500 dark:text-gray-400">If your group has more than 180 people you might consider dividing your field trip into groups of up to 180 people.</p>
              </div>
              <div>
                  <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-lg bg-brand text-white lg:h-12 lg:w-12 dark:bg-primary-900">
                    <svg viewBox="0 0 24 24" style="height: 240px; width: 240px;"><path fill="currentColor" d="M9,7V13H13V17H15V7H13V11H11V7H9Z"></path></svg>
                  </div>
                  <h3 class="mb-2 text-xl font-bold dark:text-white">School or Civic?</h3>
                  <p class="text-gray-500 dark:text-gray-400">We need to know if your group is a School Group or not. Scroll down for more information.</p>
              </div>
              <div>
                  <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-lg bg-brand text-white lg:h-12 lg:w-12 dark:bg-primary-900">
                    <svg viewBox="0 0 24 24" style="height: 240px; width: 240px;"><path fill="currentColor" d="M9,7V13H13V15H9V17H13A2,2 0 0,0 15,15V13A2,2 0 0,0 13,11H11V9H15V7H9Z"></path></svg>
                  </div>
                  <h3 class="mb-2 text-xl font-bold dark:text-white">You are ready to schedule!</h3>
                  <p class="text-gray-500 dark:text-gray-400"><a href="/" class="text-brand underline">Click here</a> to schedule online!</p>
              </div>
          </div>
        </div>
      </section>
      <form x-on:submit="handleSubmit" class="grid gap-2 max-w-4xl mx-auto" x-data="reservation" x-init="fetchData">
        <div class="grid gap-2 lg:grid-cols-3">
          <div class="flex border border-default p-4 rounded-base">
            <div class="flex items-center h-5">
                <input checked aria-describedby="helper-radio-text" type="radio" value="school-group" class="w-4 h-4 text-neutral-primary border-default-medium bg-neutral-secondary-medium rounded-full checked:border-brand focus:ring-2 focus:outline-none focus:ring-brand-subtle border appearance-none">
            </div>
            <div class="ms-2 text-sm select-none">
                <label for="helper-radio" class="font-medium text-heading mb-1">School Group</label>
                <p id="helper-radio-text" class="text-xs font-normal text-body">For public, private and home schols.</p>
            </div>
          </div>
          <div class="flex border border-default p-4 rounded-base bg-disabled cursor-not-allowed">
            <div class="flex items-center h-5">
                <input disabled aria-describedby="civic group" type="radio" class="w-4 h-4 text-neutral-primary border-default-medium bg-neutral-secondary-medium rounded-full checked:border-brand focus:ring-2 focus:outline-none focus:ring-brand-subtle border appearance-none">
            </div>
            <div class="ms-2 text-sm select-none">
                <label for="helper-radio" class="font-medium text-fg-disabled mb-1">Civic Group</label>
                <p id="helper-radio-text" class="text-xs font-normal text-body">Coming online soon!</p>
            </div>
          </div>
          <div class="flex border border-default p-4 rounded-base bg-disabled cursor-not-allowed">
            <div class="flex items-center h-5">
                <input disabled id="helper-radio" aria-describedby="helper-radio-text" type="radio" class="w-4 h-4 text-neutral-primary border-default-medium bg-neutral-secondary-medium rounded-full checked:border-brand focus:ring-2 focus:outline-none focus:ring-brand-subtle border appearance-none">
            </div>
            <div class="ms-2 text-sm select-none">
                <label for="helper-radio" class="font-medium text-fg-disabled mb-1">Birthday Party</label>
                <p id="helper-radio-text" class="text-xs font-normal text-body">Coming online soon!</p>
            </div>
          </div>
        </div>
        <h5 class="font-bold text-xl py-2">Attendance (<span x-text="students + teachers + parents">21</span>/180)</h5>
        <div x-show="totalAttendance <= 180" class="p-4 text-sm text-fg-brand-strong rounded-base bg-brand-softer" role="alert">
          <span class="font-medium">We have 180 seats!</span> We do not seat more than 180 people.
        </div>
        <div x-show="totalAttendance > 180" class="p-4 text-sm text-fg-danger-strong rounded-base bg-danger-soft" role="alert">
          <span class="font-medium">We have 180 seats!</span> We do not seat more than 180 people.
        </div>
        <div class="grid gap-2 lg:grid-cols-3">
          <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
            <h5 x-text="students" class="mb-3 text-5xl font-semibold tracking-tight text-heading leading-8 text-center">20</h5>
            <p class="text-body text-center text-sm">20 minimum required.</p>
            <input x-model.number="students" id="large-range" type="range" value="20" min="20" max="180" class="w-full mt-3 h-3 bg-neutral-quaternary rounded-full appearance-none cursor-pointer range-lg">
            <label for="large-range" class="block mb-2.5 text-sm font-medium text-heading">Students</label>
            <div class="flex gap-2 justify-center">
              <button x-on:click="++students" x-bind:disabled="totalAttendance > 180" type="button" class="cursor-pointer disabled:cursor-not-allowed disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 13.292-6"/><circle cx="10" cy="8" r="5"/><path d="M19 16v6"/><path d="M22 19h-6"/></svg>
                <span class="sr-only">Add 1</span>
              </button>
              <button x-on:click="students = 20" type="button" class="cursor-pointer inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 11.873-7"/><circle cx="10" cy="8" r="5"/><path d="m17 17 5 5"/><path d="m22 17-5 5"/></svg>
                <span class="sr-only">Reset</span>
              </button>
              <button x-on:click="--students" x-bind:disabled="students === 20" type="button" class="cursor-pointer disabled:cursor-not-allowed disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 13.292-6"/><circle cx="10" cy="8" r="5"/><path d="M22 19h-6"/></svg>
                <span class="sr-only">Subtract 1</span>
              </button>
            </div>
          </div>
          <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
            <h5 x-text="teachers" class="mb-3 text-5xl font-semibold tracking-tight text-heading leading-8 text-center" x-text-"teachers">1</h5>
            <p class="text-body text-center text-sm">minimum of 1 per 10 students</p>
            <input x-model.number="teachers" id="large-range" type="range" value="20" min="1" max="180" class="w-full mt-3 h-3 bg-neutral-quaternary rounded-full appearance-none cursor-pointer range-lg">
            <label for="large-range" class="block mb-2.5 text-sm font-medium text-heading">Teachers</label>
            <div class="flex gap-2 justify-center">
              <button x-on:click="++teachers" x-bind:disabled="totalAttendance > 180" type="button" class="cursor-pointer disabled:cursor-not-allowed disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 13.292-6"/><circle cx="10" cy="8" r="5"/><path d="M19 16v6"/><path d="M22 19h-6"/></svg>
                <span class="sr-only">Add 1</span>
              </button>
              <button x-on:click="teachers = 1" type="button" class="cursor-pointer inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 11.873-7"/><circle cx="10" cy="8" r="5"/><path d="m17 17 5 5"/><path d="m22 17-5 5"/></svg>
                <span class="sr-only">Reset</span>
              </button>
              <button x-on:click="--teachers" x-bind:disabled="teachers === 1" type="button" class="cursor-pointer disabled:cursor-not-allowed disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 13.292-6"/><circle cx="10" cy="8" r="5"/><path d="M22 19h-6"/></svg>
                <span class="sr-only">Subtract 1</span>
              </button>
            </div>
          </div>
          <div class="bg-neutral-primary-soft block max-w-sm p-6 border border-default rounded-base shadow-xs hover:bg-neutral-secondary-medium">
            <h5 x-text="parents" class="mb-3 text-5xl font-semibold tracking-tight text-heading leading-8 text-center">0</h5>
            <p class="text-body text-center text-sm">Billed in the school's invoice.</p>
            <input x-model.number="parents" id="large-range" type="range" value="0" min="0" max="180" class="w-full mt-3 h-3 bg-neutral-quaternary rounded-full appearance-none cursor-pointer range-lg">
            <label for="large-range" class="block mb-2.5 text-sm font-medium text-heading">Parents</label>
            <div class="flex gap-2 justify-center">
              <button x-on:click="++parents" x-bind:disabled="totalAttendance > 180" type="button" class="cursor-pointer disabled:cursor-not-allowed disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 13.292-6"/><circle cx="10" cy="8" r="5"/><path d="M19 16v6"/><path d="M22 19h-6"/></svg>
                <span class="sr-only">Add 1</span>
              </button>
              <button x-on:click="parents = 0" type="button" class="cursor-pointer inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 11.873-7"/><circle cx="10" cy="8" r="5"/><path d="m17 17 5 5"/><path d="m22 17-5 5"/></svg>
                <span class="sr-only">Reset</span>
              </button>
              <button x-on:click="--parents" x-bind:disabled="parents === 0" type="button" class="cursor-pointer disabled:cursor-not-allowed disabled:bg-disabled disabled:text-fg-disabled disabled:border-disabled inline-flex items-center justify-center  text-fg-brand bg-neutral-primary border border-brand hover:bg-brand hover:text-white focus:ring-4 focus:ring-brand-subtle rounded-base w-10 h-10 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-5"><path d="M2 21a8 8 0 0 1 13.292-6"/><circle cx="10" cy="8" r="5"/><path d="M22 19h-6"/></svg>
                <span class="sr-only">Subtract 1</span>
              </button>
            </div>
          </div>
        </div>
        <h5 class="font-bold text-xl py-2" id="date-and-time">Date and Time</h5>
        <div class="p-4 text-sm text-fg-brand-strong rounded-base bg-brand-softer" role="alert">
          <span class="font-medium">Minimum date is 7 days from today!</span> Plan ahead to select a good date.
        </div>
        <div class="grid gap-2 lg:grid-cols-3">
          <div>
            <label for="date" class="block mb-2.5 text-sm font-medium text-heading">Date <span class="text-red-500">*</span></label>
            <input x-on:change="onDateChange" x-bind:min="minimumDate" type="date" id="date" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="John" required />
            <p id="helper-text-explanation" class="mt-2.5 text-sm text-body">The date of your event(s), at least 7 days from today.</p>
          </div>
        </div>
        <div class="grid gap-2 lg:grid-cols-2">
          <template x-for="(event, i) in events">
            <div class="border border-default rounded-base flex">
              <div class="w-40">
                <img x-bind:src="event.show ? getShow(event).cover : '/themes/MaybornFlowbite/images/image.png'" class="rounded-base w-full h-40 object-cover" />
              </div>
              <div class="grid content-center gap-1 p-4">
                <div class="flex items-center">
                  <input x-model="event.checked" x-bind:id="event.date.getTime()" type="checkbox" class="w-4 h-4 border border-default-medium rounded-xs bg-neutral-secondary-medium focus:ring-2 focus:ring-brand-soft">
                  <label x-bind:for="event.date.getTime()" class="select-none ms-2 text-sm font-medium text-heading" x-text="format(event.date)"></label>
                </div>
                <div class="mt-4">
                  <label x-bind:for="'show-' + i" class="block mb-2.5 text-sm font-medium text-heading">Select a show</label>
                  <select x-bind:disabled="!event.checked" x-model="event.show" x-bind:id="'show-' + i" class="disabled:text-fg-disabled disabled:bg-disabled block w-full px-3 py-2.5 bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand shadow-xs placeholder:text-body">
                    <option selected>Select a show</option>
                    <template x-for="show in shows">
                      <option x-bind:value="JSON.stringify(show)" x-text="`${show.name} [${show.type}]`">Show Name</option>
                    </template>
                  </select>
                </div>
              </div>
            </div>
          </template>
        </div>
        <h5 class="font-bold text-xl py-2" id="postshows">Post Show</h5>
        <div class="p-4 mb-4 text-sm text-fg-brand-strong rounded-base bg-brand-softer" role="alert">
          <span class="font-medium">Select a post show.</span> Select one of the options below.
        </div>
        <div class="grid gap-2 lg:grid-cols-2">
          <div class="flex border border-default p-4 rounded-base">
            <div class="flex items-center h-5">
                <input x-model="postShow" name="postshow" id="postShowStarTalk" aria-describedby="helper-radio-text" type="radio" value="Star Talk" class="w-4 h-4 text-neutral-primary bg-neutral-secondary-medium rounded-full checked:border-brand focus:ring-2 focus:outline-none focus:ring-brand-subtle border border-default appearance-none">
            </div>
            <div class="ms-2 text-sm select-none">
                <label for="postShowStarTalk" class="font-medium text-heading mb-1">Star Talk</label>
                <p id="postShowStarTalk" class="text-xs font-normal text-body">A tour of the current evening sky showing all the constellations, planets and notable stars.</p>
            </div>
          </div>
          <div class="flex border border-default p-4 rounded-base">
            <div class="flex items-center h-5">
                <input x-model="postShow" name="postshow" id="postShowUniview" aria-describedby="helper-radio-text" type="radio" value="Uniview" class="w-4 h-4 text-neutral-primary border-default-medium bg-neutral-secondary-medium rounded-full checked:border-brand focus:ring-2 focus:outline-none focus:ring-brand-subtle border appearance-none">
            </div>
            <div class="ms-2 text-sm select-none">
                <label for="postShowUniview" class="font-medium text-heading mb-1">Uniview</label>
                <p id="helper-radio-text" class="text-xs font-normal text-body">A flight through the planets of our solar system, other galaxies and beyond.</p>
            </div>
          </div>
        </div>
        <h5 class="font-bold text-xl py-2">Organization Information</h5>
        <div class="p-4 mb-4 text-sm text-fg-brand-strong rounded-base bg-brand-softer" role="alert">
          <span class="font-medium">Look for your organization below.</span> 
          You will find it if your organization has done a field trip with us before.
        </div>
        <div>
          <div class="grid gap-6 mb-6 md:grid-cols-2">
            <div>
                <label for="query" class="block mb-2.5 text-sm font-medium text-heading">Enter the name of your organization</label>
                <input x-model="query" type="text" id="query" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="Organization Name" />
            </div>
            <div class="h-32 overflow-y-auto">
              <div class="grid gap-6">
                <template x-for="{id, name, city, state} in availableOrganizations">
                  <div class="flex">
                    <div class="flex items-center h-5">
                      <input x-model.number="schoolId" x-bind:id="id + name" type="radio" x-bind:value="id" name="default-radio" class="w-4 h-4 text-neutral-primary bg-neutral-secondary-medium rounded-full checked:border-brand focus:ring-2 focus:outline-none focus:ring-brand-subtle border border-default appearance-none">
                    </div>
                    <div class="ms-2 text-sm select-none">
                        <label x-bind:for="id + name" class="font-medium text-heading" x-text="name"></label>
                        <p id="helper-checkbox-text" class="text-xs font-normal text-body flex gap-1">
                          <span x-text="city"></span>
                          <span x-text="state"></span>
                        </p>
                    </div>
                  </div>
                </template>
                <div class="flex">
                  <div class="flex items-center h-5">
                      <input x-model.number="schoolId" id="no-organization" type="radio" value="0" name="default-radio" class="w-4 h-4 text-neutral-primary bg-neutral-secondary-medium rounded-full checked:border-brand focus:ring-2 focus:outline-none focus:ring-brand-subtle border border-default appearance-none">
                  </div>
                  <div class="ms-2 text-sm select-none">
                      <label for="no-organization" class="font-medium text-heading">My organization is not on the list</label>
                      <p id="helper-checkbox-text" class="text-xs font-normal text-body">Select this option if you can't find your organization</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <template x-if="schoolId == 0">
          <div>
            <div class="grid gap-6 mb-6 md:grid-cols-2">
              <div class="col-span-2">
                  <label for="organization_name" class="block mb-2.5 text-sm font-medium text-heading">Organization Name</label>
                  <input x-model="school" type="text" id="organization_name" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="Organization Name" required />
              </div>
              <div>
                  <label for="organization_address" class="block mb-2.5 text-sm font-medium text-heading">Address</label>
                  <input x-model="address" type="text" id="organization_address" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="Address" required />
              </div>
              <div>
                  <label for="organization_city" class="block mb-2.5 text-sm font-medium text-heading">City</label>
                  <input x-model="city" type="text" id="organiation_city" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="City" required />
              </div>
              <div>
                  <label for="organization_state" class="block mb-2.5 text-sm font-medium text-heading">State</label>
                  <input value="Texas" disabled type="text" id="organization_state" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="State" required />
              </div>
              <div>
                  <label for="organization_zip" class="block mb-2.5 text-sm font-medium text-heading">ZIP</label>
                  <input x-model="zip" type="text" minlength="5" maxlength="5" id="organization_zip" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="ZIP" required />
              </div>
              <div>
                  <label for="organization_phone" class="block mb-2.5 text-sm font-medium text-heading">Phone</label>
                  <input x-model="phone" type="phone" minlength="10" maxlength="10" id="organization_phone" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="Phone" required />
              </div>
            </div>
          </div>
        </template>
        <h5 class="font-bold text-xl py-2">Organizer Information</h5>
        <div>
          <div class="grid gap-6 mb-6 md:grid-cols-2">
            <div>
                <label for="firstname" class="block mb-2.5 text-sm font-medium text-heading">First Name</label>
                <input x-model="firstname" type="text" id="firstname" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="First Name" required />
            </div>
            <div>
                <label for="lastname" class="block mb-2.5 text-sm font-medium text-heading">Last Name</label>
                <input x-model="lastname" type="text" id="lastname" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="Last Name" required />
            </div>
            <div>
                <label for="email" class="block mb-2.5 text-sm font-medium text-heading">Email</label>
                <input x-model="email" type="email" id="email" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="Email" required />
            </div>
            <div>
                <label for="phone" class="block mb-2.5 text-sm font-medium text-heading">Phone</label>
                <input x-model="cell" minlength="10" maxlength="10" type="text" id="phone" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full px-3 py-2.5 shadow-xs placeholder:text-body" placeholder="Phone" required />
            </div>
          </div>
        </div>
        <h5 class="font-bold text-xl py-2">Overview</h5>
        <div x-show="selectedEvents.length <= 0" class="p-4 mb-4 text-sm text-fg-danger-strong rounded-base bg-danger-soft" role="alert">
          <span class="font-medium">You haven't selected any <a class="underline" href="##date-and-time">dates</a> and shows!</span> Select a date, check the desired time slot(s) and the a show from the dropdown.
        </div>
        <div x-show="postShow.length == 0" class="p-4 mb-4 text-sm text-fg-danger-strong rounded-base bg-danger-soft" role="alert">
          <span class="font-medium">You haven't selected <a class="underline" href="##postshows">post show</a>!</span> Constellations of the current evening sky our  full dome flight around planets and galaxies?
        </div>
        <div class="grid grid-cols-4 gap-2 my-2">
          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold flex gap-1">
              <span x-text="students"></span>
              <span>students</span>
            </h5>
            <p class="text-body text-sm">Attendance</p>
          </div>
          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold flex gap-1">
              <span x-text="teachers"></span>
              <span x-text="teachers === 1 ? 'teacher' : 'teachers'">teacher</span>
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
        <div class="grid grid-cols-4 gap-2 my-2">
          <div class="flex flex-col items-center justify-center">
            <h5 class="font-bold">School Group</h5>
            <p class="text-body text-sm">Field Trip Type</p>
          </div>
          <div x-show="postShow" class="flex flex-col items-center justify-center">
            <h5 class="font-bold" x-text="postShow"></h5>
            <p class="text-body text-sm">Post Show</p>
          </div>
          <div x-show="schoolId >= 0" class="flex flex-col items-center justify-center">
            <h5 class="font-bold" x-text="schoolId == 0 ? school : selectedOrganization?.name"></h5>
            <p class="text-body text-sm">Organization</p>
          </div>
          <div x-show="firstname.length > 0 && lastname.length > 0" class="flex flex-col items-center justify-center">
            <h5 class="font-bold" x-text="`${firstname} ${lastname}`"></h5>
            <p class="text-body text-sm">Organizer</p>
          </div>
        </div>
        <div class="grid lg:grid-cols-2 gap-2">
          <template x-for="event in selectedEvents">
            <div class="flex flex-col items-center bg-neutral-primary-soft p-6 border border-default rounded-base shadow-xs md:flex-row md:max-w-xl">
              <img class="object-cover rounded-base h-48 w-32 mb-4 md:mb-0" x-bind:src="getShow(event).cover" alt="">
              <div class="flex flex-col justify-between md:p-4 leading-normal">
                <h5 class="mb-2 text-xl font-bold tracking-tight text-heading" x-text="getShow(event).name"></h5>
                <p class="mb-6 text-body text-sm" x-text="format(event.date)"></p>
                <div>
                    <a href="##date-and-time" type="button" class="inline-flex items-center w-auto text-body bg-neutral-secondary-medium box-border border border-default-medium hover:bg-neutral-tertiary-medium hover:text-heading focus:ring-4 focus:ring-neutral-tertiary shadow-xs font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">
                      Change
                    </a>
                </div>
              </div>
            </div>
          </template>
        </div>
        <div class="grid gap-1 my-2">
          <label for="memo" class="block mb-2.5 text-sm font-medium text-heading">Notes (optional)</label>
          <textarea x-model="memo" id="memo" rows="4" class="bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand block w-full p-3.5 shadow-xs placeholder:text-body" placeholder="Write anything that will help us with your reservation."></textarea>
        </div>
        <div class="flex justify-end gap-2">
          <button x-bind:disabled="!canSubmit"  type="submit" class="disabled:bg-disabled disabled:text-fg-disabled disabled:cursor-not-allowed cursor-pointer text-white bg-brand box-border border border-transparent hover:bg-brand-strong focus:ring-4 focus:ring-brand-medium shadow-xs font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">Submit</button>
          <button type="button" class="text-body bg-neutral-primary-soft border border-default hover:bg-neutral-secondary-medium hover:text-heading focus:ring-4 focus:ring-neutral-tertiary-soft shadow-xs font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">Start Over</button>
        </div>
      </form>
    </main>
    <cfinclude template="inc/footer.cfm" />
    <script src="#$.siteConfig('themeAssetPath')#/js/schedule.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/shows.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/reservation.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/flowbite.min.js"></script>
  </body>
</html>
</cfoutput>