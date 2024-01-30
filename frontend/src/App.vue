<template>
<div class="container mx-auto px-4 pt-12">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mx-auto items-center">
    <div class="md:col-span-1">
      <h1 class="text-2xl font-bold mb-8">Subscriber Management</h1>
      <SubscriberForm @submit="createSubscriber" />
    </div>
    <div class="md:col-span-1">
      <SubscriberList :subscribers="subscribers" />
      <Pagination
        :total-pages="totalPages"
        :current-page="currentPage"
        @page-change="fetchSubscribers"
      />
    </div>
  </div>
</div>


</template>

<script>
import axios from "axios";
import SubscriberForm from "./components/SubscriberForm.vue";
import SubscriberList from "./components/SubscriberList.vue";
import Pagination from "./components/Pagination.vue";

export default {
  components: {
    SubscriberForm,
    SubscriberList,
    Pagination,
  },
  data() {
    return {
      subscribers: [],
      currentPage: 1,
      totalPages: 0,
      apiUrl:process.env.VUE_APP_API_URL
    };
  },
  mounted() {
    this.fetchSubscribers();

    this.emitter.on("page-changed", (newPage) => {
      this.handlePageChanged(newPage)

    });

    this.emitter.on("form-submitted", (formData) => {
      console.log("recived",formData);
      this.fetchSubscribers();

    });


  },
  methods: {
    fetchSubscribers() {
      console.log("APU YRL",this.apiUrl);
      axios
        .get(`${this.apiUrl}/subscribers?page=${this.currentPage}`)
        .then((response) => {
          this.subscribers = response.data.data.subscribers;
          this.totalPages = response.data.data.totalPages;
        });
    },
    handlePageChanged(newPage) {
      // Handle the page change event
      console.log(`Page changed to ${newPage}`);
      
      // You may want to update other data properties or fetch data for the new page here
      // For example, you can make an API request to fetch data for the new page
      // this.fetchDataForPage(newPage);

      // Update the current page in your component's data
      this.currentPage = newPage;
      this.fetchSubscribers(); // Refresh list
    },
  },
};
</script>

<style scoped>
/* Tailwind CSS example styling */
</style>
