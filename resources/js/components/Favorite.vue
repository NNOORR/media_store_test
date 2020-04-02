<template>
    <div class="container">
        <h3>Favorite</h3>

        <div style="width: 100px; height: 50px; float: left;">
            <nav aria-label="Page navigation example">
                <div style=" width: 250px; display: inline-block;">
                    <ul class="pagination" style="width: 250px;">
                        <li v-bind:class="[{disabled: !pagination.prev_page_url}]" class="page-item"><a class="page-link" href="#"
                                                                                                        @click="fetchFavorite(pagination.prev_page_url)">Previous</a></li>
                        <li class="page-item disabled"><a class="page-link text-dark" href="#">Page {{ pagination.current_page}} of {{ pagination.last_page }}</a></li>
                        <li v-bind:class="[{disabled: !pagination.next_page_url}]" class="page-item"><a class="page-link" href="#"
                                                                                                        @click="fetchFavorite(pagination.next_page_url)">Next</a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Media Name</th>
                <th scope="col">Media Desc</th>
                <th scope="col">Media</th>
                <th scope="col">Date</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(favorite, index) in favorites">
                <th scope="row" >{{index +1 }}</th>
                <td style="max-width: 100px; max-height: 100px; overflow: auto;">{{favorite.name}}</td>
                <td style="max-width: 300px; max-height: 200px; overflow: auto;">{{favorite.description}}</td>
                <td><img v-bind:src="favorite.path" style="height: 100px; width: 100px;" /> </td>
                <td>{{favorite.created_at}}</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>


<script>
    export default {
        data() {
            return {
                favorites: [],
                favorite: {
                    id: '',
                    name: '',
                    description: '',
                    path: '',
                    created_at: '',
                },

                pagination: {},
            }
        },
        created(){
            this.fetchFavorite();
        },

        methods: {
            fetchFavorite(page_url){
                let vm = this;
                page_url = page_url || 'api/favorite'
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
                        this.favorites = data['objList'].data;
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