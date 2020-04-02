<template>
    <div class="container">
       <h3>History</h3>

        <div style="width: 100px; height: 50px; float: left;">
            <nav aria-label="Page navigation example">
                <div style=" width: 250px; display: inline-block;">
                    <ul class="pagination" style="width: 250px;">
                        <li v-bind:class="[{disabled: !pagination.prev_page_url}]" class="page-item"><a class="page-link" href="#"
                                                                                                        @click="fetchHistory(pagination.prev_page_url)">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link text-dark" href="#">Page {{ pagination.current_page}} of {{ pagination.last_page }}</a></li>
                        <li v-bind:class="[{disabled: !pagination.next_page_url}]" class="page-item"><a class="page-link" href="#"
                                                                                                        @click="fetchHistory(pagination.next_page_url)">Next</a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Search Key</th>
                <th scope="col">Date</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(search_info, index) in history">
                <th scope="row" >{{index + 1}}</th>
                <td>{{search_info.search_key}}</td>
                <td>{{search_info.created_at}}</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>


<script>
    export default {
        data() {
            return {
                history: [],
                search_info: {
                    id: '',
                    search_key: '',
                    created_at: '',
                },

                pagination: {},
            }
        },
        created(){
            this.fetchHistory();
        },

        methods: {
            fetchHistory(page_url){
                let vm = this;
                page_url = page_url || 'api/history'
                fetch(page_url,{
                    method: 'get',
                    headers:{
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + window.localStorage.getItem('token'),
                    }
                })
                    .then(res => res.json())
                    .then(data => {
                        this.history = data['objList'].data;
                        vm.makePagination(data['objList']);
                    })
                    .catch(err => console.log(err));
            },
            makePagination(meta){
                let pagination = {
                    current_page: meta.current_page,
                    last_page: meta.last_page,
                    next_page_url: meta.next_page_url,
                    prev_page_url: meta.prev_page_url
                }

                this.pagination = pagination;
            },

        }
    };
</script>