<template>
  <form @submit.prevent="submitForm">
    <div class="space-y-12">
      <div class="border-b border-gray-900/10 pb-12">
        <h2 class="text-base font-semibold leading-7 text-gray-900">Profile</h2>
        <p class="mt-1 text-sm leading-6 text-gray-600">
          This information will be displayed publicly so be careful what you
          share.
        </p>

        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
          <div class="sm:col-span-4">
            <label
              for="username"
              class="block text-sm font-medium leading-6 text-gray-900"
              >First Name</label
            >

            <div class="mt-2">
              <div
                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md"
              >
                <input
                  type="text"
                  v-model="formData.name"
                  :required="true"
                  name="name"
                  id="name"
                  autocomplete="username"
                  class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                  placeholder="john"
                />
              </div>
            </div>
          </div>

          <div class="sm:col-span-4">
            <label
              for="username"
              class="block text-sm font-medium leading-6 text-gray-900"
              >Last Name</label
            >
            <div class="mt-2">
              <div
                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md"
              >
                <input
                  type="text"
                  v-model="formData.last_name"
                  :required="true"
                  name="last_name"
                  id="last_name"
                  autocomplete="Last Name"
                  class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                  placeholder="smith"
                />
              </div>
            </div>
          </div>

          <div class="sm:col-span-4">
            <label
              for="username"
              class="block text-sm font-medium leading-6 text-gray-900"
              >Eamil</label
            >
            <div class="mt-2">
              <div
                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md"
              >
                <input
                  type="email"
                  v-model="formData.email"
                  :required="true"
                  name="email"
                  id="email"
                  autocomplete="email"
                  class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                  placeholder="johnsmith@gmail.com"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="mt-6 flex items-center justify-end gap-x-6">
      <button
        type="button"
        class="text-sm font-semibold leading-6 text-gray-900"
      >
        Cancel
      </button>
      <button
        type="submit"
        class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
      >
        Save
      </button>
    </div>
  </form>
</template>
   
  <script>
import axios from "axios";

export default {
  data() {
    return {
      formData: {
        name: "",
        email: "",
      },
      apiUrl:process.env.VUE_APP_API_URL

    };
  },
  methods: {
    submitForm() {
      const formData = JSON.parse(JSON.stringify(this.formData));
      axios
        .post(`${this.apiUrl}/subscribers/create`, formData, {
          withCredentials: true,
        })
        .then((response) => {
          // Handle success
          console.log("Success:", response.data);
          this.formData = {}
          // You can add more logic here if needed
          alert("Subscriber created successfully!");
        })
        .catch((error) => {
          // Handle error
          console.error("Error:", error);
          // You can add more error handling logic here if needed
          alert("Error creating subscriber. Please try again.");
        });
      this.emitter.emit("form-submitted", formData);
    },
  },
};
</script>
  
  <style scoped>
/* Tailwind CSS example styling */
</style>