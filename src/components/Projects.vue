<template>
  <v-container fluid>
    <section id="start">
      <v-row>
        <v-img
          src="https://cdn.dribbble.com/users/1365253/screenshots/6719748/city-lights.png"
        >
          <v-theme-provider dark>
            <v-container fill-height>
              <v-row
                align="center"
                class="white--text mx-auto"
                justify="center"
              >
                <v-col class="white--text text-center" cols="12" tag="h1">
                  <span
                    :class="[
                      $vuetify.breakpoint.smAndDown ? 'display-1' : 'display-2',
                    ]"
                    class="font-weight-light"
                  >
                    CHOOSE
                  </span>

                  <br />

                  <span
                    :class="[
                      $vuetify.breakpoint.smAndDown ? 'display-3' : 'display-4',
                    ]"
                    class="font-weight-black"
                  >
                    WISELY
                  </span>
                </v-col>

                <v-btn
                  class="align-self-end"
                  fab
                  outlined
                  @click="$vuetify.goTo('#projects')"
                >
                  <v-icon>mdi-chevron-double-down</v-icon>
                </v-btn>
              </v-row>
            </v-container>
          </v-theme-provider>
        </v-img>
      </v-row>
    </section>

    <section id="projects">
      <div class="py-12"></div>

      <v-container class="text-center">
        <h2 class="display-2 font-weight-bold mb-3">PROJEKTI</h2>

        <v-responsive
          class="mx-auto title font-weight-light mb-8"
          max-width="720"
        >
          Odaberi projekt koji ti se najviše sviđa i možda ćeš upravo njega
          vidjeti u svom gradu. Projekt s najviše glasova pobjeđuje.
        </v-responsive>

        <div></div>

        <v-btn color="grey" outlined large>
          <span class="grey--text text--darken-1 font-weight-bold">
            BIRAJ!
          </span>
        </v-btn>

        <v-row align="center" justify="center" class="text-center">
          <v-col> </v-col
          ><v-col>
            <v-card class="mx-auto" outlined max-width="444">
              <v-img src="@/assets/trash.png" height="300px"></v-img>

              <v-card-title class="font-weight-black text-uppercase">
                {{ this.proj1.name }}</v-card-title
              >

              <v-card-subtitle>{{ this.proj1.description }}</v-card-subtitle>

              <v-card-actions>
                <v-btn color="#F05D23" text>Saznaj više</v-btn>

                <v-spacer></v-spacer>

                <v-btn icon @click="show1= !show1">
                  <v-icon>{{
                    show1 ? "mdi-chevron-up" : "mdi-chevron-down"
                  }}</v-icon>
                </v-btn>
              </v-card-actions>

              <v-expand-transition>
                <div v-show="show1">
                  <v-divider></v-divider>
                  <v-card-text> Ekstra informacije. </v-card-text>
                  <v-btn color="#F05D23" text>DAJ SVOJ GLAS</v-btn>
                </div>
              </v-expand-transition>
            </v-card>
          </v-col>
          <v-col>
            <v-card class="mx-auto" outlined max-width="444">
              <v-img src="@/assets/cowork.png" height="300px"></v-img>

              <v-card-title class="font-weight-black text-uppercase">{{
                this.proj2.name
              }}</v-card-title>

              <v-card-subtitle>{{ this.proj2.description }}</v-card-subtitle>

              <v-card-actions>
                <v-btn color="#F05D23" text>Saznaj više</v-btn>

                <v-spacer></v-spacer>

                <v-btn icon @click="show2 = !show2">
                  <v-icon>{{
                    show2 ? "mdi-chevron-up" : "mdi-chevron-down"
                  }}</v-icon>
                </v-btn>
              </v-card-actions>

              <v-expand-transition>
                <div v-show="show2">
                  <v-divider></v-divider>
                  <v-card-text> Ekstra informacije. </v-card-text>
                  <v-btn color="#F05D23" text>DAJ SVOJ GLAS</v-btn>
                </div>
              </v-expand-transition>
            </v-card>
          </v-col>
          <v-col>
            <v-card class="mx-auto" outlined max-width="444">
              <v-img src="@/assets/light.png" height="300px"></v-img>

              <v-card-title class="font-weight-black text-uppercase">{{
                this.proj3.name
              }}</v-card-title>

              <v-card-subtitle>{{ this.proj3.description }}</v-card-subtitle>

              <v-card-actions>
                <v-btn color="#F05D23" text>Saznaj više</v-btn>

                <v-spacer></v-spacer>

                <v-btn icon @click="show3 = !show3">
                  <v-icon>{{
                    show3 ? "mdi-chevron-up" : "mdi-chevron-down"
                  }}</v-icon>
                </v-btn>
              </v-card-actions>

              <v-expand-transition>
                <div v-show="show3">
                  <v-divider></v-divider>
                  <v-card-text> dd </v-card-text>
                  <v-btn color="#F05D23" text>DAJ SVOJ GLAS</v-btn>
                </div>
              </v-expand-transition>
            </v-card></v-col
          >
          <v-col> </v-col>
        </v-row>
      </v-container>

      <div class="py-12"></div>
    </section>
  </v-container>
</template>

<script>
import Web3 from "web3";
const Projects = require("../../build/contracts/Projects.json");

export default {
  name: "Projects",
  mounted() {},
  data: () => ({
    show1: false,
    show2: false,
    show3: false,
    proj1: {},
    proj2: {},
    proj3: {},
  }),
  methods: {
    async initialize() {
      const web3 = new Web3(window.ethereum);
      //get contract creator
      let contractAcc = await web3.eth.getAccounts(console.log);
      console.log("contract created by: " + contractAcc[0]);
      //get acc on metamask
      const metaMaskAcc = await ethereum.request({
        method: "eth_requestAccounts",
      });
      console.log("current acc on metamask: " + metaMaskAcc[0]);
      const netId = await web3.eth.net.getId();
      const deployedNetwork = Projects.networks[netId];
      //get our contract
      const projectsContract = new web3.eth.Contract(
        Projects.abi,
        deployedNetwork.address
      );
      //call contract's methods
      let projectsCount = await projectsContract.methods.projectsCount().call();
      this.proj1 = await projectsContract.methods.projects(1).call();
      this.proj2 = await projectsContract.methods.projects(2).call();
      this.proj3 = await projectsContract.methods.projects(3).call();

      // let vote = await projectsContract.methods.vote(1).send({from: metaMaskAcc[0]})
      // console.log(vote)
    },
  },
  created: function () {
    this.initialize();
  },
};
</script>