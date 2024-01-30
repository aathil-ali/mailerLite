<template>
    <nav v-if="totalPages > 1" aria-label="Page navigation example">
      <ul class="inline-flex -space-x-px text-base h-10">
        <li>
          <a
            href="#"
            @click.prevent="changePage(currentPage - 1)"
            class="flex items-center justify-center px-4 h-10 ms-0 leading-tight text-gray-500 bg-white border border-e-0 border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
          >
            Previous
          </a>
        </li>
        <li v-for="pageNumber in visiblePageNumbers" :key="pageNumber">
          <a 
            href="#"
            @click.prevent="changePage(pageNumber)"
            class="flex items-center justify-center px-4 h-10 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
          >
            {{ pageNumber }}
          </a>
        </li>
  
        <li>
          <a
            href="#"
            @click.prevent="changePage(currentPage + 1)"
            class="flex items-center justify-center px-4 h-10 leading-tight text-gray-500 bg-white border border-gray-300 rounded-e-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
          >
            Next
          </a>
        </li>
      </ul>
    </nav>
  </template>
  
  <script>
  export default {
    props: {
      currentPage: Number,
      totalPages: Number,
    },
    emits: ['page-changed'],
    computed: {
      visiblePageNumbers() {
        const start = Math.max(1, this.currentPage - 2);
        const end = Math.min(this.totalPages, start + 4);
        return Array.from({ length: end - start + 1 }, (_, index) => start + index);
      },
    },
    methods: {
      changePage(newPage) {
        if (newPage >= 1 && newPage <= this.totalPages && newPage !== this.currentPage) {
            this.emitter.emit("page-changed", newPage);
        }
      },
    },
  };
  </script>
  