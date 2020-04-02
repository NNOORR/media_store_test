<template>
    <div>
    <nav class="navbar navbar-expand-sm navbar-dark bg-info mb-2">
        <div class="container">
            <router-link class="navbar-brand" to="/">Media Store</router-link>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav mr-auto">

                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Authentication Links -->
                    <li class="nav-item" v-if="checkAuth('login')">
                        <router-link class="nav-link" to="/login">Login</router-link>

                    </li>


                    <li class="nav-item" v-if="checkAuth('register')">
                        <router-link class="nav-link" to="/register">Register</router-link>
                    </li>

                    <li class="nav-item" v-if="checkAuth('history')">
                        <router-link class="nav-link" to="/history">History</router-link>
                    </li>

                    <li class="nav-item" v-if="checkAuth('favorite')">
                        <router-link class="nav-link" to="/favorite">Favorite</router-link>
                    </li>

                    <li style="cursor:pointer;" @click="logout()"class="nav-item" v-if="checkAuth('logout')">
                        <span  class="nav-link">Logout</span>

                    </li>


                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            <span class="caret"></span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"
                               onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                            </a>

                            <form id="logout-form" action="#" method="POST" style="display: none;">

                            </form>
                        </div>
                    </li>

                </ul>

            </div>

        </div>
    </nav>

        <router-view />
    </div>
</template>

<script>
    export default {

        methods: {
            checkAuth(buttonType) {
              if(window.localStorage.getItem('token') == null) {
                  if (buttonType == 'login' || buttonType == 'register')
                      return true;

                  return false;
              }
              else {
                  if (buttonType == 'login' || buttonType == 'register')
                      return false;

                  return true;
              }
            },

            logout(){
                //Remove Token from local storage
                window.localStorage.removeItem('token');
                window.location.href = "/";
            }
        }
    };
</script>